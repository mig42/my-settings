#!/bin/bash
BAT=/sys/class/power_supply/BAT0
CONS_PATH="/sys/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/conservation_mode"
AC_ONLINE=$(cat /sys/class/power_supply/AC/online 2>/dev/null || cat /sys/class/power_supply/ADP1/online 2>/dev/null)
CAPACITY=$(cat $BAT/capacity)
GOVERNOR=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
CONS=$(cat "$CONS_PATH" 2>/dev/null || echo "?")

if [ "$AC_ONLINE" = "1" ]; then ICON=""; STATE="AC"; else ICON=""; STATE="BAT"; fi
if [ "$CONS" = "1" ]; then CONS_LABEL="conservación ON"; else CONS_LABEL="conservación OFF"; fi

echo "{\"text\": \"$ICON $CAPACITY% ($GOVERNOR)\", \"tooltip\": \"Estado: $STATE\n$CONS_LABEL\nClick: toggle conservación\"}"
