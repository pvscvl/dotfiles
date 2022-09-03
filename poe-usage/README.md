# poe-usage
## Shows only ports using PoE and how much power is used. 

As oneliner:
>   `swctrl poe show | sed -n 3,5p && swctrl poe show | grep -w On && swctrl poe show | sed -n 5p && echo -n "Total PoE Usage (W): " && swctrl poe show | awk '{s+=$9}END{print s}'`

![poe-usage](/poe-usage/poe-usage.png)
