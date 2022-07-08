"""
Turn on and off XSS and screen saver blanking.

Configuration parameters:
    button_toggle: mouse button to toggle XSS (default 1)
    cache_timeout: refresh interval for this module (default 15)
    format: display format for this module (default '{icon}')
    icon_off: show when XSS is disabled (default 'XSS')
    icon_on: show when XSS is enabled (default 'XSS')

Format placeholders:
    {icon} XSS icon

Color options:
    color_on: Enabled, defaults to color_good
    color_off: Disabled, defaults to color_bad

@author Andre Doser <dosera AT tf.uni-freiburg.de>

SAMPLE OUTPUT
{'color': '#00FF00', 'full_text': 'XSS'}

off
{'color': '#FF0000', 'full_text': 'XSS'}
"""


class Py3status:
    """
    """

    # available configuration parameters
    button_toggle = 1
    cache_timeout = 15
    format = "{icon}"
    icon_off = "XSS"
    icon_on = "XSS"

    class Meta:
        deprecated = {
            "rename": [
                {
                    "param": "format_on",
                    "new": "icon_on",
                    "msg": "obsolete parameter use `icon_on`",
                },
                {
                    "param": "format_off",
                    "new": "icon_off",
                    "msg": "obsolete parameter use `icon_off`",
                },
            ]
        }

    def post_config_hook(self):
        self.color_on = self.py3.COLOR_ON or self.py3.COLOR_GOOD
        self.color_off = self.py3.COLOR_OFF or self.py3.COLOR_BAD

    def _is_xss_enabled(self):
        if "timeout:  0" in self.py3.command_output("xset -q"):
            return False

        return True

    def dpms(self):
        """
        Display a colorful state of XSS.
        """
        if self._is_xss_enabled():
            _format = self.icon_on
            color = self.color_on
        else:
            _format = self.icon_off
            color = self.color_off

        icon = self.py3.safe_format(_format)

        return {
            "cached_until": self.py3.time_in(self.cache_timeout),
            "full_text": self.py3.safe_format(self.format, {"icon": icon}),
            "color": color,
        }

    def on_click(self, event):
        """
        Control XSS with mouse clicks.
        """
        if event["button"] == self.button_toggle:
            if self._is_xss_enabled():
                self.py3.command_run("xset s off")
            else:
                self.py3.command_run("xset s default")


if __name__ == "__main__":
    """
    Run module in test mode.
    """
    from py3status.module_test import module_test

    module_test(Py3status)
