#!/bin/bash
#
# battery check script
# ====================
# Designed to be run continuously while WM is running
# Requires libnotify to be installed
#

ICONPATH=$HOME/icons/24x18
BATDIR=/sys/class/power_supply/BAT0
NOTIFYSEND=/usr/bin/notify-send

if [ ! -x $NOTIFYSEND ]
then
    exit 0
fi

# check every $CHECK seconds
CHECK=60

( while true
do
    BATSTATE=`cat ${BATDIR}/status`
    # Note valid BATSTATE values are: Charged, Charging, and Discharging
    if [ "$BATSTATE" = "Discharging" ]
    then
        REM_CAP=`cat ${BATDIR}/charge_now`
        FULL_CAP=`cat ${BATDIR}/charge_full`
        CHARGE=`echo $(( $REM_CAP * 100 / $FULL_CAP ))`
        if [ "$CHARGE" -lt "5" ]
        then
            systemctl suspend
        fi
        if [ "$CHARGE" -lt "25" ]
        then
            $NOTIFYSEND -i $ICONPATH/battery_critical.png -u critical -t 30000 "battery critical" "Shutdown or connect power now"
            sleep $CHECK
            continue
        fi
        if [ "$CHARGE" -lt "30" ]
        then
            $NOTIFYSEND -i $ICONPATH/battery_low.png -u normal -t 20000 "battery low" "Connect power soon"
        fi
        sleep $CHECK
    elif [ "$BATSTATE" = "Charged" ]
    then
        $NOTIFYSEND -i $ICONPATH/battery_full.png -u normal -t 20000 "battery fully charged" "Disconnect from power"
        sleep $CHECK
    else
        sleep $CHECK
    fi
done
) &

# end of file
