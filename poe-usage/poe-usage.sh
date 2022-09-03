#!/bin/bash

swctrl poe show | sed -n 3,5p
swctrl poe show | grep -w On
swctrl poe show | sed -n 5p
echo -n "Total PoE Usage (W): " && swctrl poe show | awk '{s+=$9}END{print s}'
