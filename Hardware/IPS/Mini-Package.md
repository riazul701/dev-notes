# Mini-Package.md

# Features

## Like IPS, Auto On When Electricity Off, Auto Off When Electricity On

* Relay-based automatic switching (very reliable)

# Safety

## General

**12 Volt UPS Battery**

* 12 Volt Battery Charger With Full-Charge Auto Cut System.

**Voltage Regulation & Protection**

* Even if the battery is “nominal 12 V” the real voltage may be:
  * ~11 V when discharging
  * ~13.5 V when charging

* So it’s best to use:
  * A DC-DC converter / voltage regulator (set at 12 V)
  * A fuse for safety

* For example:
  * A 12 V 5 A DC-DC converter
  * A 5–10 A inline fuse and holder

* **Always install a fuse near the battery**

* **Use thick wires**

## Charger Capacity Of Battery (12 Volt)

* If load is connected directly while charging:
  * Some chargers cannot supply load + charge simultaneously
  * Voltage may fluctuate

## Battery (12 Volt) Needs Ventilation

* Battery needs ventilation—don’t keep it in a sealed box.

## Battery (12 Volt) Protection (Over-Charge) (Built-In Inside Charger)

* Choose correct "Ampere" charger, so that it can charge battery and run fan, light at the same time.

* Protection: Overload, Short-Circuit, Overheat, Reverse Polarity

* Float charger keeps safe voltage. Increases battery life.

* “smart charger” actually uses stage charging.

* Both charger will work, but 6 A charger is safer and healthier for 12 V 9 Ah sealed/dry lead-acid battery than 10 A charger.

* Avoid:
  * Cheap “Auto-cut only” chargers without float
  * Very thin wires
  * Running battery to full drain daily

* [12V 6A Smart Battery Charger with Digital Display | Auto-Cut HW631 Module for Dry, Lithium & Lead Acid Batteries](https://dipalok.com/product/12v-6a-smart-battery-charger-with-digital-display-auto-cut-hw631-module-for-dry-lithium-lead-acid-batteries/)

* [12V 6A Digital Fast Battery Charger with LCD Display | Wet & Dry Lead Acid Battery](https://www.electronics.com.bd/12v-6a-digital-fast-battery-charger-with-lcd-display-wet-dry-lead-acid-battery)

## Battery (12 Volt) Over-Discharge Protection

* [XH-M609 DC 12V-36V Charger Module Voltage OverDischarge Battery Protection Precise Undervoltage Board M209](https://www.daraz.com.bd/products/xh-m609-dc-12v-36v-m209-i551066371.html)

## Notes

* Router UPS does not need DC to AC current conversion. Computer UPS needs DC to AC current conversion. Because of this reason, router UPS has better efficiency and no power loss during DC to AC conversion and low price than computer UPS. 

* Check maximum output power (in watt) of router UPS. Also check watt usage of DC light and fan. Comparing these values, DC light and fan can be used using router UPS.

* Create emergency light with router UPS: Router UPS is connected to a IPS backup enabled socket. Light is attached to router UPS. When IPS backup is finished, then attached light in router UPS will be turned on automatically.

* Should not use computer UPS directly to provide electricity to 12Volt DC solar fan for backup, because inside UPS battery DC to AC conversion losses 25% capacity and solar fan adapter's AC to DC conversion losses another 30%. In total approximately 55% battery capacity losses. <sup>ChatGPT: "inverter loss from 12 volt dc to 220 volt ac from 7.5 ah battery" && "220 volt AC to 12 volt DC adapter loss"</sup>
  * Instead use router UPS, because it does not convert DC to AC current and again not AC to DC current.

* Check UPS battery charger has auto charging cut feature and full charge indicator.

# References

## Websites

* [ssgeshop.com => DC current Fan, Light](https://ssgeshop.com/)
* [safebdes.com => DC current Fan, Light](https://safebdes.com/)

## Products

**Mini IPS - 12 Volt DC**

* Beware that, this mini IPS are using 2nd hand battery, which only lasts about 2 months.

* [Modhumoti Mini DC Output IPS](https://bdpromart.com/product-show/181)

**Fan**

* [Walton Car Fan](https://waltonbd.com/fan/car-fan/wcrf08a)
* [NOHA 12 Inch 5W 12V Solar DC Table Fan At Best Price In Bangladesh](https://www.techxzon.com/product/noha-12-inch-5w-12v-solar-dc-table-fan-at-best-price-in-bangladesh/)
* [NOHA 16 Inch 7W 12V Solar DC Table Fan At Best Price In Bangladesh](https://www.techxzon.com/product/noha-16-inch-7w-12v-solar-dc-table-fan-at-best-price-in-bangladesh/)
* [Vision DC Table Fan -12" (Use With Only Battery 12Volt)](https://othoba.com/vision-dc-table-fan-12-use-with-onlybattery12volt-268277)

## YouTube Tutorials

* UPS Battery + Charger + DC Fan/Light
  * [ব্যাটারি দিয়ে ফ্যান বানান ব্যাকআপ পাবেন ২৪ ঘণ্টা | How to make Solar/charger FAN at Home BY Signal Mastar Diy](https://www.youtube.com/watch?v=8rYsVnm228k)
  * [ব্যাটারি দিয়ে ফ্যান বানান ব্যাটারি ব্যাকআপ পাবেন ৮/১০ ঘন্টা | Home Made Charger Fan | Solar BY E Tech Home](https://www.youtube.com/watch?v=Am8_a8nlBp4)
