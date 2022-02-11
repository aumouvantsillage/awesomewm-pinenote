
Base OS and packages
--------------------

Install the Minimal Manjaro rootfs for Quartz64 from:
https://github.com/manjaro-arm/quartz64-bsp-images/releases

```
pacman  -S awesome lightdm lightdm-gtk-greeter xf86-input-evdev \
           xterm nano xournalpp onboard \
           inter-font hack-font
```

Setup autologin (as root)
-------------------------

Add user to `autologin` group:

```
groupadd autologin
gpasswd -a guillaume autologin
```

Configure LightDM. Edit `/etc/lightdm/lightdm.conf`.

```
[Seat:*]
...
xserver-command=X -nocursor
...
autologin-user=guillaume
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
        Option    "TransformationMatrix" "-1 0 1 0 -1 1 0 0 1"
EndSection
```

Run desktop environment
-----------------------

```
systemctl enable --now lightdm
```

TODO
----

* Window manager Theme
* Menu
* Status bar
* Launcher
* Touch support
* Default applications
  * Xournalpp
  * KOReader
