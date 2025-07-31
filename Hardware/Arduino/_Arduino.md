# Arduino

## Important

**ESP32 logic level shifting: 5V → 3.3V (Step-Down) --and-- 3.3V → 5V (Step-Up)**

* Directly connecting a 5V signal to an ESP32 GPIO can damage the pin, especially if it's a digital input.
  * Don’t connect MQ sensors directly to ESP32’s GPIOs without logic level shifting if running at 3.3V.

* [I2C Logic Level Shifter Bi-Directional Four-way two-way logic level transformation module](https://www.electronics.com.bd/modules-shields/i2c-logic-level-shifter)

## Notes

* Wifi Smart Plug/Socket LAN Control: Turn on/off the device even when WiFi has no Internet access.

* In arduino/esp32, always check/test output with a LED light.

* In arduino/esp32, EEPROM is used for storing configs/settings but have limited write cycles. Alternatives are SPIFFS, LittleFS, SD Card. <sup>ChatGPT</sup>
  * Use arduino/esp32 and blynk.io virtual pins to store configs/settings like auto/manual mode. Use this combo: Blynk for remote control and EEPROM or Preferences (NVS) on ESP32 to store last-known settings locally

* Use ultrasonic sensor once per minute for durability at longer period.

* "Relay" does not always work with 5Volt, because 1Volt/0.5Volt is cached/consumed by "relay" coil sometimes and "relay" does not switch. Threfore, supply 6Volt for "relay" and transistor, resistor required.<sup>{7}</sup>

* If LCD display does not show output properly, then reconnect/restart it. <sup>{5}</sup>
  * Normal LCD has 16 connection, I2C-LCD has only 4 connection. Choose I2C-LCD for use. <sup>{8}</sup>

# Hardware And Software

## Hardwares Required

* Arduino UNO

**ESP32 Board Selection**

* [ESP32 Development Board CP2102 Chip 38 Pin](https://techshopbd.com/product/esp32-development-board-cp2102-chip-38-pin)
* [ESP32 Development Board DEVKIT V1](https://techshopbd.com/product/esp32-development-board-devkit-v1)

* ChatGPT Question: "ESP32 Development Board CP2102 Chip 38 Pin VS ESP32 Development Board DEVKIT V1"
  * CP2102 is a USB-to-Serial (UART) bridge chip. It’s reliable and well-supported across Windows, macOS, and Linux.
  * Some DevKit V1 versions come with CH340, which may require special drivers or have compatibility quirks.
  * So, if you want plug-and-play reliability, the CP2102 version is often more convenient, especially for Windows users.
  * If you want more GPIOs, no USB driver hassle, and more flexibility, go for the ESP32 38-pin with CP2102.

## Softwares Required

* IDE (Integrated Development Environment)/Software
  * [Arduino IDE](https://www.arduino.cc/en/software/#ide)
  * [PlatformIO Site => Use with Visual Studio Code](https://platformio.org/) || [PlatformIO GitHub](https://github.com/platformio/platformio-core) && [Visual Studio Code](https://code.visualstudio.com/) <sup>{10} {14}</sup>
  * [espressif/esp-idf GitHub](https://github.com/espressif/esp-idf)
  * [appinventor.mit.edu => Create android app graphically](https://appinventor.mit.edu/) <sup>{15}</sup>
  * [ArduinoDroid - Arduino/ESP8266 BY Anton Smirnov => Android App IDE](https://play.google.com/store/apps/details?id=name.antonsmirnov.android.arduinodroid2)
  * [Serial USB Terminal BY Kai Morich => Android App](https://play.google.com/store/apps/details?id=de.kai_morich.serial_usb_terminal)
  * [Serial WiFi Terminal BY Kai Morich => Android App](https://play.google.com/store/apps/details?id=de.kai_morich.serial_wifi_terminal)
  * [Serial Bluetooth Terminal BY Kai Morich => Android App](https://play.google.com/store/apps/details?id=de.kai_morich.serial_bluetooth_terminal) <sup>{9}</sup>

* Simulation
  * [Proteus Design Suite => Arduino Simulation, Windows Only](https://www.labcenter.com/)
  * [tinkercad.com => AutoDesk Tinkercad, Arduino Simulation, Online](https://www.tinkercad.com/)
  * [wokwi.com => ESP32 Simulation](https://wokwi.com/)
    * [Wokwi Megasearch](https://wokwi.com/experimental/megasearch)
    * [Wokwi Simulator BY Wokwi](https://marketplace.visualstudio.com/items?itemName=wokwi.wokwi-vscode) && [Visual Studio Code](https://code.visualstudio.com/) <sup>{14}</sup>
      * Free Plan: License renewal every 30 days <sup>ChatGPT</sup>
    * Wokwi supports internet via the default "Wokwi-GUEST" Wi-Fi. ssid = "Wokwi-GUEST"; password = ""; <sup>ChatGPT</sup>
  * [fritzing.org => Arduino Simulation, Windows, Linux](https://fritzing.org/) || [fritzing/fritzing-app GitHub](https://github.com/fritzing/fritzing-app)

* Remote Control Using Internet, Localhost, Notification, Database, Logs, MQTT
  * [blynk.io => Web, Android App](https://blynk.io/) <sup>{7}</sup>
    * [Blynk IoT BY Blynk Technologies Inc. => Android App](https://play.google.com/store/apps/details?id=cloud.blynk) <sup>{7}</sup>
  * [ifttt.com => Web, Android App](https://ifttt.com/) <sup>{9}</sup>
    * [IFTTT - Automate work and home BY IFTTT, Inc => Android App](https://play.google.com/store/apps/details?id=com.ifttt.ifttt) <sup>{9}</sup>
  * [thingspeak.mathworks.com](https://thingspeak.mathworks.com/) <sup>{12}</sup>
    * [ThingView - ThingSpeak viewer BY cinetica-tech => Android App, Not Official](https://play.google.com/store/apps/details?id=com.cinetica_tech.thingview)
  * [io.adafruit.com => Adafruit IO](https://io.adafruit.com/) <sup>{16}</sup>
  * [firebase.google.com](https://firebase.google.com/) <sup>{13}</sup>
  * [remotexy.com](https://remotexy.com/) <sup>{11}</sup>
    * [RemoteXY: Arduino control BY EV CODE LABS, LLC => Android App](https://play.google.com/store/apps/details?id=com.shevauto.remotexy.free) <sup>{11}</sup>

# Working Way And Tools

## Data Transfer

**ESP32 Data Transfer <sup>ChatGPT</sup>**

* esp32 to esp32 data transfer => "ESP-NOW", Wifi, Bluetooth, Antenna, "LoRa" etc.
* esp32 to computer data transfer
* esp32 "ESP-NOW" data transfer distance
  * External antennas on some ESP32 boards (e.g. ESP32-WROVER or ESP32-WROOM-32U) can double range.
  * All ESP-NOW peers must be on the same Wi-Fi channel to communicate reliably.
  * Use repeaters/relay nodes (ESP-NOW mesh style)
* Attach Antenna or LoRa module externally, if required.
* [ESP32-CAM External Antenna](https://store.roboticsbd.com/internet-of-things-iot/1852-esp32-cam-external-antenna-robotics-bangladesh.html)

**Waterproof-Casing/Others**

* [100x60x25mm Black Plastic Project Box Small Junction Box ABS Waterproof Project Enclosure Box for Electronics](https://www.electronics.com.bd/rc-hobby-components/black-plastic-project-box-100x60x25mm)

# References

* next-sl: {18}

## Websites

* [agucova/awesome-esp GitHub](https://github.com/agucova/awesome-esp)
* [Edzelf/ESP32Radio-V2 GitHub](https://github.com/Edzelf/ESP32Radio-V2)

* Shop
  * [techshopbd.com => Arduino, ESP32, Motijheel, Dhaka](https://techshopbd.com/)
  * {1} [nabatechshop.com => Arduino, ESP32](https://nabatechshop.com/)
  * {2} [bigyanproject.com => Arduino, ESP32, Farmgate, Dhaka](https://bigyanproject.com/en/)
  * [electronics.com.bd => Arduino, ESP32, Farmgate, Dhaka](https://www.electronics.com.bd/)
  * [bdtronics.com => Arduino, ESP32, Fakirapool, Motijheel, Dhaka](https://www.bdtronics.com/)
  * [citytechbd.com => Arduino, ESP32, Nawabpur, Dhaka](https://www.citytechbd.com/)
  * [store.roboticsbd.com => Arduino, ESP32](https://store.roboticsbd.com/)
  * [robohub.com.bd => Arduino, ESP32, Khilkhet, Dhaka](https://robohub.com.bd/)

## Tutorials

* Arduino
  * [Arduino Tutorial](https://www.tutorialspoint.com/arduino/index.htm)
  * [eazytronic.com](https://eazytronic.com/) <sup>{8}</sup>

* ESP32
  * [ESP32 for IoT Tutorial](https://www.tutorialspoint.com/esp32_for_iot/index.htm)
  * [ESP32 => Wikipedia](https://en.wikipedia.org/wiki/ESP32)

* IDE, Simulation
  * [docs.wokwi.com](https://docs.wokwi.com/)
  * [atomicparade/wokwi-simulator-vs-code.md => GitHub Gist](https://gist.github.com/atomicparade/d0f93b84d00b6fedfc58df4f78957071)
  * [Getting Started with PlatformIO](https://dronebotworkshop.com/platformio/) <sup>{17}</sup>

## Projects

* ESP32
  * [250+ ESP32 Projects, Tutorials and Guides with Arduino IDE](https://randomnerdtutorials.com/projects-esp32/)

## YouTube Tutorials

* Arduino, Relay, Servo-Motor
  * {5} [Arduino Bangla Tutorial BY Naba Tech World => PlayList-Selected](https://www.youtube.com/playlist?list=PL7euiE97qGc0QbibUmHn5MBrF2V7w3NDa)
  * {8} [TinkerCad Tutorial in Hindi For Circuit Design BY EAZYTRONIC => PlayList-Selected, Arduino, tinkercad.com Simulation](https://www.youtube.com/playlist?list=PL4an6ELdlijducM1Y3oltzyFagC6Hx23Z)
  * [Arduino Bangla Tutorial Part - 32: A Complete Introduction to Arduino Board | Arduino Hardware BY Naba Tech World](https://www.youtube.com/watch?v=A9nT71p27Tc&list=PL7euiE97qGc0QbibUmHn5MBrF2V7w3NDa&index=33)
  * [Arduino is easy, actually BY Robonyx](https://www.youtube.com/watch?v=tiGw9PQbvrg)

* ESP32
  * [ESP32 Programming Full Course in Hindi | Zero to Hero BY Arduino Titan => PlayList-Selected, ESP32, wokwi.com Simulation](https://www.youtube.com/playlist?list=PLG9nLVRjxsskY_qyEeWY6OTjesJQEz0b_)
  * [Wokwi Simulator Tutorials – Arduino + ESP32 Projects BY Arduino Titan => PlayList](https://www.youtube.com/playlist?list=PLG9nLVRjxssk-NKTi5_Kv7DO7jX-yOIkH)
  * {9} [ESP32 learn basic tutorial Bangla BY Science Research & Engineering experiment => PlayList](https://www.youtube.com/playlist?list=PL_YKIKJeS4qMy1yHfk2fZs_-zj8qNDe7a)
  * [IOT Bangla Tutorial BY Naba Tech World => PlayList](https://www.youtube.com/playlist?list=PL7euiE97qGc2lQlH8QvDU-eoqhHIwd4dC)
  * [ESP32 For Beginners BY DIY TechRush => PlayList](https://www.youtube.com/playlist?list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd)
  * [ESPNOW using ESP32 BY techiesms => PlayList](https://www.youtube.com/playlist?list=PLruzZCuhcsGOt7oAw01aM4fiHPyfv7Fx3)
  * [Arduino To ESP32: How to Get Started! BY Robonyx](https://www.youtube.com/watch?v=RiYnucfy_rs)
  * [ESP32 বোর্ডকে আরডুইনোর মতো ব্যবহার করুন | ESP32 Expansion Board BY Naba Tech World](https://www.youtube.com/watch?v=08cGLrtxiQ4)

* Remote Control Using Internet, Localhost, Notification, Database, Logs, MQTT
  * [IoT Projects using Blynk BY techiesms => PlayList](https://www.youtube.com/playlist?list=PLruzZCuhcsGPG4nVhEQPDj-I_VpzO7AkI)
  * [IFTTT projects BY techiesms => PlayList](https://www.youtube.com/playlist?list=PLruzZCuhcsGO57UMuq_F27J59snz0B7QM)
  * {13} [Control Devices Anywhere 🌍 with Google Firebase & ESP32 ✅ BY DIY TechRush](https://www.youtube.com/watch?v=wrIs2m7Q8Ic&list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd&index=24)
  * {12} [Connect to ThingSpeak with ESP32 ✅ (Keep Track of EVERYTHING🌍) BY DIY TechRush](https://www.youtube.com/watch?v=FV8sHH_hneA&list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd&index=27)
  * {15} [Bluetooth LED Control App with MIT App Inventor - STEP By STEP BY DIY TechRush](https://www.youtube.com/watch?v=w5LgLsCumFI&list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd&index=15)
  * {11} [Mastering IoT: Build Your Own Controller App with RemoteXY BY DIY TechRush](https://www.youtube.com/watch?v=F3T0NSiQITM&list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd&index=22)
  * [ESP32 Home Automation Using Blynk 2.0 With Online Simulator ||Wokwi BY Technical Shubham](https://www.youtube.com/watch?v=_96Kfo2_pOk)
  * {16} [ARDUINO IDE + ESP32 + Adafruit IO | Monitoring and Controlling the ESP32 with Adafruit IO BY Uteh Str](https://www.youtube.com/watch?v=H1ATqf4gBAU)

* IDE, Sumilation, Proteus, Wokwi, Tinkercad
  * {14} [ESP32 Simulator for IoT Projects in VS Code Using Wokwi BY StechiezDIY](https://www.youtube.com/watch?v=3WVz2XdadD0)
  * {10} [Perfect Combo for ESP32: VS Code & PlatformIO Guide ✅ BY DIY TechRush](https://www.youtube.com/watch?v=WxELHnnlBmU&list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd&index=25)
  * {17} [Getting Started with PlatformIO BY DroneBot Workshop](https://www.youtube.com/watch?v=JmvMvIphMnY)
  * {6} [Proteus Tutorial BY EEE Campus => PlayList](https://www.youtube.com/playlist?list=PL2bh00zqE3V8rHQWhbj5-geDcD4Xxcjeg)
  * [10 Best Circuit Simulators for 2025! BY ToP Projects Compilation](https://www.youtube.com/watch?v=fLzmRKxGGtI)

* Projects
  * {7} [How to Make IOT Based Smart Water Tank Controller | Full Tutorial with Code, Diagram and Blynk App BY Naba Tech World](https://www.youtube.com/watch?v=DUGFp8SYNz8&list=PL7euiE97qGc2lQlH8QvDU-eoqhHIwd4dC&index=7)
  * [মিনি ওয়াইফাই ক্যামেরা তৈরী করুন খুব সহজেই | ESP32 Camera Module ব্যবহার করার পদ্ধতি BY Naba Tech World](https://www.youtube.com/watch?v=y2WL2cClBaI&list=PL7euiE97qGc2lQlH8QvDU-eoqhHIwd4dC&index=16)
  * [ESP32 CAM Send Captured Image to Google Drive BY How To Electronics](https://www.youtube.com/watch?v=1Lu8FwC2CWQ)

* Arduino Components (Relay, Serve-Motor)
  * {3} [Arduino Bangla Tutorial Part - 20: What is Relay? How to control AC load using Relay with Arduino? BY Naba Tech World](https://www.youtube.com/watch?v=q8tqDCRmIhg&list=PL7euiE97qGc0QbibUmHn5MBrF2V7w3NDa&index=21)
  * {4} [Arduino Bangla Tutorial Part - 24: What is Servo Motor? How to use Servo Motor with Arduino BY Naba Tech World](https://www.youtube.com/watch?v=TaFBqZFUTLE&list=PL7euiE97qGc0QbibUmHn5MBrF2V7w3NDa&index=25)
