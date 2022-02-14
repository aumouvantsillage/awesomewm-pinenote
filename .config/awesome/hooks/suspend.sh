#!/usr/bin/bash

# Wait for signal PrepareForSleep (issued before suspend)
dbus-monitor --system --profile "interface='org.freedesktop.login1.Manager',member='PrepareForSleep'" | read

# Save backlight settings.
light -s sysfs/backlight/backlight_cool -O
light -s sysfs/backlight/backlight_warm -O

# Turn backlight off.
light -s sysfs/backlight/backlight_cool -S 0
light -s sysfs/backlight/backlight_warm -S 0
