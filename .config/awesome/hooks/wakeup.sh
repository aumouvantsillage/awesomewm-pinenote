#!/usr/bin/bash

# Wait for signal PrepareForSleep (issued after resume)
dbus-monitor --system --profile "interface='org.freedesktop.login1.Manager',member='PrepareForSleep'" | read

# Restore backlight settings.
light -s sysfs/backlight/backlight_cool -I
light -s sysfs/backlight/backlight_warm -I
