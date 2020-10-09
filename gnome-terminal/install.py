#!/usr/bin/env python3
import os, re, subprocess, glob

UUID_REGEX = r"[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}"
DCONF_CMD=["command -v dconf"]
GSETTINGS_CMD=["command -v gsettings"]

DCONF_PATH="/org/gnome/terminal/legacy/profiles:/"
GSETTINGS_PATH="org.gnome.Terminal.ProfilesList"
GSETTINGS_KEY="list"

DEFAULT_SETTINGS={
    "path": "org.gnome.Terminal.Legacy.Settings",
    "keys": {
        "confirm-close": "false",
        "menu-accelerator-enabled": "false"
    }
}


def get_commands():
    dconf = subprocess.run(DCONF_CMD, shell=True, capture_output=True, encoding="utf-8")
    if dconf.stdout == '':
        return

    gsettings = subprocess.run(GSETTINGS_CMD, shell=True, capture_output=True, encoding="utf-8")
    if gsettings.stdout == '':
        return

    return dconf.stdout.strip(), gsettings.stdout.strip()


def get_profiles():
    path = os.path.dirname(os.path.realpath(__file__))
    files = glob.glob(path + "/*.dconf")

    return files


def load_profile(filepath, dconf, gsettings):
    with open(filepath) as file:
        uuid = re.findall(UUID_REGEX, file.readline().strip())[0]
        file.seek(0)
        subprocess.run([dconf, 'load', DCONF_PATH], stdin=file)

    # get current list
    profile_list = subprocess.run(
        [gsettings, 'get', GSETTINGS_PATH, GSETTINGS_KEY],
        capture_output=True,
        encoding="utf-8"
    )
    uuids = set(re.findall(UUID_REGEX, profile_list.stdout))
    uuids.add(uuid)

    # add new profile
    subprocess.run(
        [gsettings, 'set', GSETTINGS_PATH, GSETTINGS_KEY, "['" + "','".join(uuids) + "']"]
    )


def set_options(gsettings):
    for key, val in DEFAULT_SETTINGS['keys'].items():
        subprocess.run(
            [gsettings, 'set', DEFAULT_SETTINGS['path'], key, val]
        )


def main():
    files = get_profiles()
    dconf, gsettings = get_commands()

    for file in files:
        load_profile(file, dconf, gsettings)

    set_options(gsettings)


if __name__ == "__main__":
    # execute only if run as a script
    main()
