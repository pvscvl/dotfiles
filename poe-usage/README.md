# poe-usage
## Shows only ports using PoE and how much power is used. 

As oneliner:
>   `swctrl poe show | sed -n 3,5p && swctrl poe show | grep -w On && swctrl poe show | sed -n 5p && echo -n "Total PoE Usage (W): " && swctrl poe show | awk '{s+=$9}END{print s}'`

![poe-usage](/poe-usage.png)

`Port  OpMode      HpMode    PwrLimit   Class   PoEPwr  PwrGood  Power(W)  Voltage(V)  Current(mA)
                              (mW)
----  ------  ------------  --------  -------  ------  -------  --------  ----------  -----------
   1    Auto        Dot3at        -1  Class 4      On     Good      7.90       53.74       147.00
   2    Auto        Dot3at        -1  Class 4      On     Good      3.70       53.62        69.00
   3    Auto        Dot3at        -1  Class 0      On     Good      3.20       54.24        59.00
   6    Auto        Dot3at        -1  Class 4      On     Good      4.90       53.85        91.00
   7    Auto        Dot3at        -1  Class 1      On     Good      1.90       52.78        36.00
  12    Auto        Dot3at        -1  Class 2      On     Good      1.50       53.57        28.00
----  ------  ------------  --------  -------  ------  -------  --------  ----------  -----------
Total PoE Usage (W): 23.1
`
