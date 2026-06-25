# Mini-Package.md

## Notes

* For Solar => Many MPPT controllers are designed to be connected directly to their own solar panels. From same solar panel, multiple parallel operations in multiple MPPT controllers are not supported.

# Features

## Solar Table Fan+Light

* LED light is built-in into 12 volt solar fan.

## Like IPS, Auto On When Electricity Off, Auto Off When Electricity On

* Mini DC (12 volt) output IPS (Modhumoti) works this way.

* Relay-based automatic switching (very reliable).

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

## Battery Charging Safety

* 12 volt dry lead acid battery.

* Charging it in a sealed space (hydrogen gas risk).

* Hydrogen is highly flammable. In a completely closed room or box, the gas can build up and a spark can ignite it.

* When a lead-acid battery charges, it can produce small amounts of hydrogen gas and oxygen, especially if:
  * it is overcharged,
  * charged too fast,
  * old or damaged,
  * or not a sealed maintenance-free type.

* Possible spark sources:
  * connecting/disconnecting charger clips,
  * switches,
  * relays,
  * static electricity,
  * short circuits.

* That’s why people recommend:
  * charging in a ventilated area,
  * not covering the battery while charging,
  * keeping flames/smoking away,
  * using the correct charger voltage/current.

* Modern sealed “dry” SLA batteries usually release very little gas under normal charging, so the risk is low if used properly. But ventilation is still a good safety habit.

## Battery Terminal Connection

* Caution: Do not use "clip" to connect inverter machine to battery. It makes loose connection, generates heat and fire, damages the battery and inverter machine.

* For mini IPS use "cap" to connect dry lead acid battery, because "nut" is not available for this type of battery. This "cap" type of connection is used in computer UPS.

* In normal branded IPS like Smarten inverter machine is connected to Eastern battery using "nut".

* In computer UPS "cap" is used to connect inverter machine to battery.

## Lithium Iron Phosphate (LiFePO₄) Battery

* Buy Charger Accordingly => “3S” and “4S” describe how many lithium cells are connected in series inside a battery pack. “S” = series. "3S" Nominal: ~11.1V (3 × 3.7V). "4S" Nominal: ~14.8V.

* Pros
  * Much safer chemistry → very low fire risk
  * Very long lifespan → ~2000–6000+ cycles
  * Stable voltage output → consistent performance
  * Handles deep discharge well (can use ~80–100% capacity)
  * Better heat tolerance than regular Li-ion

* A Battery Management System adds:
  * Over-charge protection
  * Over-discharge protection
  * Over-current / short circuit protection
  * Cell balancing

* Charger
  * CHECK => Charger gets heated too much or not during charging the battery.
  * A charger compatible with LiFePO₄ voltage (≈14.2–14.6V for 12V packs)
  * Always use proper charger + inverter settings

## Charger Capacity Of Battery (12 Volt Dry-Lead-Acid)

* If load is connected directly while charging:
  * Some chargers cannot supply load + charge simultaneously
  * Voltage may fluctuate

## Battery (12 Volt) Needs Ventilation

* Battery needs ventilation—don’t keep it in a sealed box.

## Battery (12 Volt Dry-Lead-Acid) Charger's Protection

* Choose correct "Ampere" charger, so that it can charge battery and run fan, light at the same time.
  * 12 volt 7.5 AH dry lead acid battery needs 2 Ampere charger.

* SMPS vs Transformer based charger.
  * SMPS stands for Switched Mode Power Supply.
  * Common examples of SMPS: Laptop charger, Phone charger, LED TV power supply, Desktop computer PSU

* Protection: Over-Charge, Overload, Short-Circuit, Overheat, Reverse Polarity

* 🔄 Charging stages (very important)
  * Good chargers charge batteries in stages: Three-stage battery charging:
    * Bulk stage → Fast charging
    * Absorption stage → Slow full charge
    * Float stage → Maintain full battery
    * Battery stays full at float voltage
  * 👉 This increases battery life significantly
  * “smart charger” actually uses stage charging.

* Both charger will work, but 6 A charger is safer and healthier for 12 V 9 Ah sealed/dry lead-acid battery than 10 A charger.

* Avoid:
  * Cheap “Auto-cut only” chargers without float
  * Very thin wires
  * Running battery to full drain daily

* [12V 6A Smart Battery Charger with Digital Display | Auto-Cut HW631 Module for Dry, Lithium & Lead Acid Batteries](https://dipalok.com/product/12v-6a-smart-battery-charger-with-digital-display-auto-cut-hw631-module-for-dry-lithium-lead-acid-batteries/)

* [12V 6A Digital Fast Battery Charger with LCD Display | Wet & Dry Lead Acid Battery](https://www.electronics.com.bd/12v-6a-digital-fast-battery-charger-with-lcd-display-wet-dry-lead-acid-battery)

## Battery (12 Volt Dry-Lead-Acid) Over-Discharge Protection

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
* [aniktelecom.com](https://aniktelecom.com/)
* [tahaeshop.com](https://www.tahaeshop.com/public/index.php)

## Products

**Other Batteries**

* [Doublepow 9V 650mAh Rechargeable Lithium-ion Battery with Built-in Micro USB Charging Port & LED Indicator Facility Ideal for Multimeters, Smoke Detectors and More - 2 Pieces](https://www.daraz.com.bd/products/doublepow-9v-650mah-i183594637.html)

**Lithium Iron Phosphate (LiFePO₄) Battery Charger**

* [14.6V 2A Output Charger for 4S 12V 6Ah & 9Ah LiFePO4 Battery pack - 1 Piece](https://www.daraz.com.bd/products/4s-12v-6ah-9ah-lifepo4-146v-2a-1-i521326444.html)

* [14.6V 5A Output Charger for 4S 12.8V 20Ah & 30Ah LiFePO4 Battery pack - 1 Piece](https://www.daraz.com.bd/products/4s-20ah-30ah-lifepo4-146v-5a-1-i521334254.html)

* [DC 12V (12.4V) 2A Output Charger for 12V 2.8Ah, 5.6Ah, 8Ah, 10Ah, 12Ah, 21Ah 3S Lithium-ion Battery Pack - 1 Piece Charger](https://www.daraz.com.bd/products/12v-28ah-56ah-8ah-10ah-12ah-21ah-3s-dc-12v-124v-2a-1-i521339313.html)

**Lithium Iron Phosphate (LiFePO₄) Battery**

* [Doublepow 12.8V-9Ah 4S Lithium Iron Phosphate (LiFePO4) Battery Cell 2000 Cycles with 14.6V2A Output 4S Lithium Battery Charger for DC Solar Fan - 1 Piece](https://www.daraz.com.bd/products/doublepow-128v-9ah-4s-lithium-iron-phosphate-lifepo4-battery-cell-2000-cycles-with-146v2a-output-4s-lithium-battery-charger-for-dc-solar-fan-1-piece-i530328203-s2547055220.html)

* [Doublepow 12V 12Ah Lithium ion Battery for Energy Storage (Solar- UPS) (If used in solar system must have solar controller) with 1 Piece AC-DC Adapter - 1 Piece](https://www.daraz.com.bd/products/doublepow-12v-12ah-ups-1-ac-dc-1-i248771946.html)

* [Doublepow 12V 21Ah Rechargeable Battery for 12V DC Water Pump & Solar System use (If used in solar system must have solar controller) with 1 Piece AC-DC Adapter For Charging From AC - 1 Piece](https://www.daraz.com.bd/products/12v-dc-doublepow-12v-21ah-1-ac-dc-ac-1-i248777241.html)

* [Doublepow 12V 30Ah Lithium Iron Phosphate LiFePO4 Battery 30Ah LFP with 14.6V 5A Output 4S Lithium Battery Charger Combo For Golf Carts, UPS, Forklift, Energy Storage, Power Tools, 12.8V LFP - 1 Piece](https://www.daraz.com.bd/products/doublepow-12v-30ah-lifepo4-30ah-lfp-146v-5a-4s-ups-128v-lfp-1-i530367238.html)

**12 Volt Dry Lead Acid Battery Charger**

* [VISERO 12V 5A Smart Fast Battery Charger Auto Cut-Off for 12v 5A to 100A Acid, Dry, Gel Battery Charging => Charger Mode: Three-Stage (Bulk, Absorption, Float)](https://www.bdpromart.com/product-show/677)

* [12V 6A Smart Battery Charger with Digital Display | Auto-Cut HW631 Module for Dry, Lithium & Lead Acid Batteries](https://dipalok.com/product/12v-6a-smart-battery-charger-with-digital-display-auto-cut-hw631-module-for-dry-lithium-lead-acid-batteries/)

**Mini IPS - 12 Volt DC**

* Beware that, this mini IPS are using 2nd hand battery, which only lasts about 2 months.

* [Modhumoti Mini DC Output IPS](https://bdpromart.com/product-show/181)

**Fan**

* [LAVA 8 Inch DC Solar Table Fan | Table Stand + Clip 2-in-1 | 12V Portable Fan for Home & Outdoor => Run silently without noise](https://biswasent.com/product/lava-8-inch-dc-solar-table-fan/)
* [Anik Table Fan, Desktop Fan, 12 Volt DC Battery Operated Fan, Model Dabai](https://www.daraz.com.bd/products/12-dc-i311620622-s1398874878.html)
  * [Anik 220 Volt Ac Fan, Fan, Table Fan, Desktop Fan, Home Appliance, Summer Cooling Fan - Table Fan](https://www.daraz.com.bd/products/220-i416498822-s2047491739.html)
* [Walton Car Fan](https://waltonbd.com/fan/car-fan/wcrf08a)
* [NOHA 12 Inch 5W 12V Solar DC Table Fan At Best Price In Bangladesh](https://www.techxzon.com/product/noha-12-inch-5w-12v-solar-dc-table-fan-at-best-price-in-bangladesh/)
* [NOHA 16 Inch 7W 12V Solar DC Table Fan At Best Price In Bangladesh](https://www.techxzon.com/product/noha-16-inch-7w-12v-solar-dc-table-fan-at-best-price-in-bangladesh/)
* [Vision DC Table Fan -12" (Use With Only Battery 12Volt)](https://othoba.com/vision-dc-table-fan-12-use-with-onlybattery12volt-268277)

## YouTube Tutorials

**Charger**

* [12v Battery charger How to select best Battery charger BY MS Technology](https://www.youtube.com/watch?v=qA_yCeXUCq4)

* [Adapter vs Charger 🔋 | Which one should you use for what purpose? | 12V Lithium Battery Charging ... BY Electronics Insight Bangla](https://www.youtube.com/watch?v=pigdIRrMhHQ)

* [A good quality 12 volt battery charger (tested) BY BD MADE](https://www.youtube.com/watch?v=mTjYUzXcnww)

* [6v 12v 24v 48v Digital Battery Charger Price | কোন বেটারিতে কি ধরনের কত এমপিআর চার্জার ব্যবহার করবেন BY Sheetal Room](https://www.youtube.com/watch?v=9BMtk74nkGc)

**DC Current Cable**

* [Dc Cabol Size Bangla Tutorial | সোলার ক্যাবল এর সঠিক সাইজ কত জেনে নিন BY 
IPS Bazar - Bangladesh](https://www.youtube.com/watch?v=FXuxVQ6GyvM)

**UPS Battery + Charger + DC Fan/Light**
  
* [ব্যাটারি দিয়ে ফ্যান বানান ব্যাকআপ পাবেন ২৪ ঘণ্টা | How to make Solar/charger FAN at Home BY Signal Mastar Diy](https://www.youtube.com/watch?v=8rYsVnm228k)

* [ব্যাটারি দিয়ে ফ্যান বানান ব্যাটারি ব্যাকআপ পাবেন ৮/১০ ঘন্টা | Home Made Charger Fan | Solar BY E Tech Home](https://www.youtube.com/watch?v=Am8_a8nlBp4)

**Mini DC IPS => Readymade + DIY**

* [আইপিএস মাত্র ৩৯৯০টাকায় DC 12v IPS Set with Light Fan onu-Router Cable only 3990tk BY Sheetal Room](https://www.youtube.com/watch?v=MYACfMASd6c)

* [How to make 12.Volt DC mini ips at home কিভাবে একটি মিনি আইপিএস বানাবেন। Ips Price In Bangladesh BY Power Solution](https://www.youtube.com/watch?v=Ekq26Eh3s5E)

**DIY Charger Fan**

* [How to make 9 inchi High speed rechargeable fan | নিজেই তৈরি করুন হাই স্পিড রিচার্জেবল ফ্যান। BY Signal Mastar Diy](https://www.youtube.com/watch?v=fZQpYB956zE)

**Solar**

* [ডিসি হতে ডিসি নাকি ডিসি হতে এসি লোড চললে বেশী সুবিধা পাওয়া যাবে, DC vs AC Load. BY Training 24](https://www.youtube.com/watch?v=xH_aHPF13vM)

* [একাধিক সোলার প্যানেল কিভাবে কানেকশন করলে ১২ এবং ২৪ ভোল্ট পাওয়া য়ায়।how to connect solar panels. BY Training 24](https://www.youtube.com/watch?v=bSDWY-JfbZY)

* [কত এম্পিয়ার ব্যাটারিতে কত ওয়াট সোলার প্যানেল ও চার্জ কন্ট্রোলার লাগবে।solar panel calculation. BY Training 24](https://www.youtube.com/watch?v=JkCxkvVopt0)

* [সোলার সিস্টেম।অনগ্রিড অফগ্রিড হাইব্রিড কোন সোলার সিস্টেম স্থাপন করবেন।Solar system install. BY Training 24](https://www.youtube.com/watch?v=ZUEPUUoB6W4)

* [লক্ষ টাকার সোলার লাগানোর পরে | এখন কেন আবার কারেন্ট বিল বেশি উঠে। Why is the current bill not saved? BY Electric BD](https://www.youtube.com/watch?v=3Bz2Yf7QExE)

* [I lost all my money on a solar system. BY Showrove's World](https://www.youtube.com/watch?v=AqkHu-H6_Zk)

* [Think 100 times before building a solar system? Solar System BY Learning Engineering Bangla and Learning Engineering Institute](https://www.youtube.com/watch?v=V-GukBWp1y8)

* [DC vs AC Solar Setup | Advantages and Disadvantages? Which one to take? DC vs AC Solar System | W... BY Learning Engineering Bangla and 2 more](https://www.youtube.com/watch?v=d1of1vggL0o)

* [সোলার ডিসি সিস্টেম নাকি সোলার এসি সিস্টেম - কোনটা আপনার জন্য ভালো হবে BY Showrove's World](https://www.youtube.com/watch?v=umQjXTfegCM)

* [Solar System 100% Profit | Learn from My Mistakes |100% Profit in Solar System | Learn from My Mi... BY Learning Engineering Bangla and Learning Engineering Institute](https://www.youtube.com/watch?v=J7iVZVr04GU)

**DIY Wall Fan**

* [Stand Fan convert to wall fan DIY Easily. BY it's me](https://www.youtube.com/watch?v=7aKrG58CJXs)

* [How To Convert Stand Fan Into Wall Fan BY DIY @ home](https://www.youtube.com/watch?v=AHPWd7p2P2Q)

* [Table Fan Convert To Wall Fan!! Table Fan Repair'' Multi angle Fan BY Halibali atoz](https://www.youtube.com/watch?v=wp49BBD8Nbk)

**Table Fan Safety**

* [Ensuring Your Baby's Safety Around Fans: The Electric Fan Cover Mesh Finger Protection! #cutebaby BY BabyVK](https://www.youtube.com/shorts/ve565PXaMqk)

* [Fan Safety Net Cover For Finger Protection BY Jaliwale](https://www.youtube.com/watch?v=VkRM870MfWQ)

* [How To Install Finger Protection Net Cover in Industrial Fan BY NEST PROTECTION](https://www.youtube.com/watch?v=UUiVcFkpYIs)
