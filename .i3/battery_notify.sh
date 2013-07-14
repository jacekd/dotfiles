#!/bin/bash

BATINFO=$(acpi -b)

if [[ $(echo $BATINFO | grep Discharging) && $(echo $BATINFO | cut -f 5 -d " ") < 00:15:00  ]]; then
  $(which i3-nagbar) -m "critical battery level. please connect your charger" -b "Hibernate" 'sudo pm-hibernate &' > /dev/null 2>&1 &
fi
