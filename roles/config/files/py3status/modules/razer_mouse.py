# -*- coding: utf-8 -*-

import openrazer.client


class Py3status:
    format = '{percent}% {batt_icon} {poll}hz'
    dev_number = 0

    discharging_icons = {
        100: "\uf578",
        90: "\uf581",
        80: "\uf580",
        70: "\uf57f",
        60: "\uf57e",
        50: "\uf57d",
        40: "\uf57c",
        30: "\uf57b",
        20: "\uf57a",
        10: "\uf579",
        0: "\uf58d"
    }
    charging_icon = "\uf583"
    cache_timeout = 60
    threshold_bad = 10
    threshold_degraded = 30
    threshold_full = 100

    def razer_mouse(self):
        percent, charging = self._get_battery_status()
        poll_rate = self._get_poll_rate()

        if percent is not None:
            # icon
            if charging:
                icon = self.charging_icon
            else:
                icon = self.discharging_icons[percent // 10 * 10]

            # colour
            if charging:
                colour = self.py3.COLOR_CHARGING or "#FCE94F"
            elif percent < self.threshold_bad:
                colour = self.py3.COLOR_BAD
            elif percent < self.threshold_degraded:
                colour = self.py3.COLOR_DEGRADED
            elif percent >= self.threshold_full:
                colour = self.py3.COLOR_GOOD
            else:
                colour = None
        else:
            percent = ''
            colour = 'grey'
            icon = '\uf87f'

        if poll_rate is None:
            poll_rate = ''

        return {
            "full_text": self.py3.safe_format(self.format, {'percent': percent, 'batt_icon': icon, 'poll': poll_rate}),
            "color": colour,
            "cached_until": self.py3.time_in(self.cache_timeout)
        }

    def on_click(self, event):
        button = event['button']
        if button != 1:
            return

        pr = self._get_poll_rate()
        if pr is None:
            return

        if pr == 125:
            npr = 500
        elif pr == 500:
            npr = 1000
        elif pr == 1000:
            npr = 125
        else:
            return

        self._set_poll_rate(npr)

        self.py3.update()

    def _get_device(self):
        dev_manager = openrazer.client.DeviceManager()
        device = dev_manager.devices[self.dev_number]

        if device.firmware_version == 'v0.0':
            return None

        return device

    def _get_battery_status(self):
        device = self._get_device()
        if device is None:
            return (None, False)

        return (device.battery_level, device.is_charging)

    def _get_poll_rate(self):
        device = self._get_device()
        if device is None:
            return None

        return device.poll_rate

    def _set_poll_rate(self, poll_rate):
        device = self._get_device()
        if device is None:
            return False

        device.poll_rate = poll_rate

        return True


if __name__ == "__main__":
    """
    Run module in test mode.
    """
    from py3status.module_test import module_test

    module_test(Py3status)
