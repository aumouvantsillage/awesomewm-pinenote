
These are my notes and configuration files for running Linux on [PINE64's PineNote](https://www.pine64.org/pinenote/).
My setup uses the following software:

* Distribution: Manjaro ARM.
* Display manager: LightDM.
* Window manager: Awesome.
* On-screen keyboard: Onboard.

![Awesome menu](screenshots/awesomewm-pinenote-menu.jpg)

![Xterm and Onboard](screenshots/awesomewm-pinenote-xterm.jpg)

Credits
-------

Background image used in theme: [Knowledge enlightenment](https://unsplash.com/photos/J4kK8b9Fgj8)
by Olia Gozha, published under the [Unsplash licence](https://unsplash.com/license).

Base OS and packages
--------------------

Install Archlinux using [Dorian Rudolph's instructions](https://github.com/DorianRudolph/pinenotes).
I am using pgwipeout's kernel and the [Minimal Manjaro rootfs for Quartz64](https://github.com/manjaro-arm/quartz64-bsp-images/releases).

```
pacman  -S awesome lightdm lightdm-gtk-greeter xf86-input-evdev upower \
           xterm nano xournalpp onboard firefox \
           inter-font hack-font

yay -S ttf-material-icons-git
```

You can install KOReader from the `PKGBUILD` provided in folder `koreader`.

Setup autologin (as root)
-------------------------

Add user to `autologin` group:

```
groupadd autologin
gpasswd -a your-user-name autologin
```

Configure LightDM. Edit `/etc/lightdm/lightdm.conf`.

```
[Seat:*]
...
xserver-command=X -nocursor
...
autologin-user=your-user-name
...
```

Configure Xorg (as root)
------------------------

Create `/etc/X11/xorg.conf.d/pinenote.conf` with:

```
Section "InputClass"
        Identifier "evdev touchscreen"
        MatchProduct "tt21000"
        MatchIsTouchscreen "on"
        #MatchDevicePath "/dev/input/event5"
        Driver        "evdev"
EndSection

Section "InputClass"
        Identifier    "RotateTouch"
        MatchProduct    "w9013"
        #Option    "TransformationMatrix" "-1 0 1 0 -1 1 0 0 1"
EndSection
```

Run desktop environment
-----------------------

```
systemctl enable --now lightdm
```

Additional settings
-------------------

On-screen keyboard: use high contrast theme.

```
gsettings set org.onboard theme '/usr/share/onboard/themes/HighContrast.theme'
```

Hardware control
----------------

Battery:

```
cat /sys/class/power_supply/rk817-battery/charge_now
cat /sys/class/power_supply/rk817-battery/charge_full
cat /sys/class/power_supply/rk817-battery/charge_full_design
cat /sys/class/power_supply/rk817-battery/status

# or

upower -i /org/freedesktop/UPower/devices/battery_rk817_battery
```

Frontlight:

```
cat /sys/class/backlight/backlight_cool/max_brightness
echo N > /sys/class/backlight/backlight_cool/brightness

cat /sys/class/backlight/backlight_warm/max_brightness
echo N > /sys/class/backlight/backlight_warm/brightness
```

Suspend:

```
systemctl suspend -i
# Press power button to exit suspend mode
```

E-Ink panel refresh:

```
echo 1 | sudo tee /sys/module/rockchip_ebc/parameters/force_refresh
```

Custom settings
---------------

In `~/.config/awesome/rc.lua`:

* Use custom theme (`.config/awesome/theme`).
* Restrict available layouts.
* Define tag list.
* Add menu entries for applications and on-screen keyboard (Onboard).
* Disable titlebar for Onboard and make it non-focusable.
* Add button to force a refresh of the e-ink panel.
* Add battery status.

In `~/.Xresources`:

* Font configuration for Xterm.

In `~/.dmrc`:

* Set session to AwesomeWM.

In `~/.profile`:

* Set keyboard layout.

In `/etc/systemd/logind.conf.d/power-button-suspend.conf`:

* Suspend when the power button is pressed.

In `/etc/udev/rules.d/90-pinenote.rules` (based on the rules file from SXMO):

* Brightness and refresh controls: grant write access to `video` group.

TODO
----

* Suspend when closing the smart cover. Resume when opening it.
* More info in status bar
  * Wi-Fi
  * Stylus battery
* UI for frontlight control
* Launcher
