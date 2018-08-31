#!/bin/bash

### Written for Raspbian 9.4

if [ `uname -m` != "armv7l" ]
then
    echo "Doesn't look like this is a Raspberry Pi"
    exit 1
else
    echo "Setting up Raspberry Pi..."
fi

bash ./keyboard

bash ./wifi

bash ./os_utils

bash ./date_sync

bash ./declutter

echo "Done. Probably need to reboot."
