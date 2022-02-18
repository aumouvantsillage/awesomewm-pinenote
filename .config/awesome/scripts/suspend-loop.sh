#!/usr/bin/bash
while true; do
    # Lock the suspend process until suspend.sh has completed.
    systemd-inhibit --what="sleep" --who="Awesome" --why="UI cleanup" --mode="delay" $XDG_CONFIG_HOME/awesome/scripts/suspend.sh
    # Execute wake-up script.
    $XDG_CONFIG_HOME/awesome/scripts/wakeup.sh
done
