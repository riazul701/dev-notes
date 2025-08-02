# Arduino

## Important

**ESP32 logic level shifting: 5V → 3.3V (Step-Down) --and-- 3.3V → 5V (Step-Up) <sup>ChatGPT</sup>**

* Directly connecting a 5V signal to an ESP32 GPIO can damage the pin, especially if it's a digital input.
  * Don’t connect MQ sensors directly to ESP32’s GPIOs without logic level shifting if running at 3.3V.

* [I2C Logic Level Shifter Bi-Directional Four-way two-way logic level transformation module](https://www.electronics.com.bd/modules-shields/i2c-logic-level-shifter)

**General**

* GPIO pins are not 5Volt tolerant. <sup>{18}</sup>

## Notes

* On some ESP32 board, press (maybe press and hold) physical button ("boot" button) on board during upload program from arduino-ide or platformio. <sup>{18}: Introduction to ESP32 Board - Getting Started ( Step by Step)</sup>

* Wifi Smart Plug/Socket LAN Control: Turn on/off the device even when WiFi has no Internet access.

* Blynk VS Firebase+MIT-App-Inventor VS Firebase+React-Native.
* In arduino/esp32, always check/test output with a LED light with resistor.
  * LED's longer leg is positive and shorter leg is negative. <sup>{18}</sup>

* In arduino/esp32, EEPROM is used for storing configs/settings but have limited write cycles. Alternatives are SPIFFS, LittleFS, SD Card. <sup>ChatGPT</sup>
  * Use arduino/esp32 and blynk.io virtual pins to store configs/settings like auto/manual mode. Use this combo: Blynk for remote control and EEPROM or Preferences (NVS) on ESP32 to store last-known settings locally

* Use ultrasonic sensor once per minute for durability at longer period.

* "Relay" does not always work with 5Volt, because 1Volt/0.5Volt is cached/consumed by "relay" coil sometimes and "relay" does not switch. Threfore, supply 6Volt for "relay" and transistor, resistor required.<sup>{7}</sup>

* If LCD display does not show output properly, then reconnect/restart it. <sup>{5}</sup>
  * Normal LCD has 16 connection, I2C-LCD has only 4 connection. Choose I2C-LCD for use. <sup>{8}</sup>

# Hardware And Software

## Hardware Required

* Arduino UNO

**ESP32 Board Selection**

* Check `Over-the-Air (OTA)` feature in ESP32. It is used for uploading program to ESP32 using wifi.

* [ESP32 Development Board CP2102 Chip 38 Pin](https://techshopbd.com/product/esp32-development-board-cp2102-chip-38-pin)
* [ESP32 Development Board DEVKIT V1](https://techshopbd.com/product/esp32-development-board-devkit-v1)

* ChatGPT Question: "ESP32 Development Board CP2102 Chip 38 Pin VS ESP32 Development Board DEVKIT V1"
  * CP2102 is a USB-to-Serial (UART) bridge chip. It’s reliable and well-supported across Windows, macOS, and Linux.
  * Some DevKit V1 versions come with CH340, which may require special drivers or have compatibility quirks.
  * So, if you want plug-and-play reliability, the CP2102 version is often more convenient, especially for Windows users.
  * If you want more GPIOs, no USB driver hassle, and more flexibility, go for the ESP32 38-pin with CP2102.

**Waterproof-Casing/Others**

* [100x60x25mm Black Plastic Project Box Small Junction Box ABS Waterproof Project Enclosure Box for Electronics](https://www.electronics.com.bd/rc-hobby-components/black-plastic-project-box-100x60x25mm)

## Software Required

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

# Working Way and Tools

## Controlling ESP32 - Local and Remote

* ESP32 Serial Communication
* ESP32 Web Server
* Blynk
* IFTTT
* Thingspeak
* AdafruitIO
* Firebase
* RemoteXY

* To discover ESP32 using `domain-name.local` instead of changing IP address in local wifi, there must be `mDNS (Multicast DNS)` feature in wifi router. <sup>ChatGPT: esp32 serial communation using local wifi when ip address changes</sup>
  * Tips for Reliability
  * Ensure your Wi-Fi router supports mDNS (Multicast DNS).
  * Make sure firewalls don’t block port `5353` (used by mDNS).
  * Avoid port conflicts — use another port like `2323` if needed (inside ESP32 program).

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

* Transfter data from ESP32 to computer/mobile and computer/mobile to ESP32 using serial-data and telnet protocol.
* Transfer data from ESP32 to ESP32 using ESP-NOW protocol.

## Wifi Router Does Not Support mDNS (Multicast DNS)

**ChatGPT Question: "esp32 local domain name when wifi router does not support mdns"**

* If your Wi-Fi router doesn't support mDNS (Multicast DNS), your ESP32's esp32.local domain name will not resolve automatically. However, you still have several options to assign and use a local domain name with your ESP32:

* 🛠️ Problem
  * ESP32 uses `esp32.local` via mDNS, but it doesn’t work because your router doesn't support mDNS broadcasting between devices.

* ✅ Solutions (Ranked Best to Easiest)

* 🧩 1. Set Up a Local mDNS Resolver on Your PC
  * If your router doesn't handle `.local` domains, your PC can do it instead.

  * 🔹 For Linux:
    * Install `avahi-daemon`:
```bash
sudo apt install avahi-daemon avahi-utils
```
    * Then you can access `esp32.local` directly.

  * 🔹 For Windows:
    * Install [Bonjour Print Services](https://support.apple.com/en-us/106380) from Apple.
    * Then try:
```bash
ping esp32.local
```
    * If it works, OTA and TCP communication will too.

  * 🔹 For macOS:
    * Already supports mDNS by default.

* 🖥 2. Assign a Static IP to Your ESP32
  * If mDNS fails and you don’t want external dependencies:
  * 🧱 Hardcode a static IP:
```cpp
IPAddress local_IP(192, 168, 1, 123);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 255, 0);

WiFi.config(local_IP, gateway, subnet);
WiFi.begin(ssid, password);
```
  * This guarantees the ESP32 always uses `192.168.1.123`.
    * 🔸 You can then edit your computer’s `hosts` file to simulate a local domain:
    * Windows:
```makefile
C:\Windows\System32\drivers\etc\hosts
```
    * Linux/macOS:
```bash
/etc/hosts
```
    * Add:
```lua
192.168.1.123  esp32.local
```
    * Now `esp32.local` works without mDNS.

* 🌐 3. Use a Local DNS Server (Advanced)
  * If you want full `.local` or custom domain support on your LAN:
  * Set up a local DNS server:
    * Raspberry Pi: Use Pi-hole or dnsmasq
    * Local router: Some advanced routers (OpenWRT, DD-WRT, pfSense) allow DNS entries
    * Docker: Run `dnsmasq` or `coredns` in a container on your PC/server
  * Configure your ESP32 with a static hostname and IP, and your LAN DNS can resolve it.

* 🧪 4. Broadcast IP via Serial or Display
  * If you can't use any name resolution:
    * Print the IP to serial:
```cpp
Serial.println(WiFi.localIP());
```
    * Or use an OLED, LCD, or web UI to show the current IP
    * Or have ESP32 post its IP to a cloud or local server
  * Then manually access that IP.

* 🧠 Summary
  * Title: Solution => Needs Router mDNS? => Complexity => Pros
  * Use Bonjour / Avahi on PC => ❌ => 🟢 Easy => Works with `.local` names
  * Static IP + `/etc/hosts` => ❌ => 🟡 Medium => Works without mDNS, predictable
  * Run a local DNS (Pi-hole, OpenWRT) => ❌ => 🔴 Hard => Best for large/advanced networks
  * Print or send IP => ❌ => 🟢 Easy => No mDNS or DNS needed, but manual

* Would you like a code template that both prints IP over Serial and serves a simple webpage to show its current status?

## ESP32 `Over-the-Air (OTA)` Program Upload

**ChatGPT Question: "ESP32 Over-the-Air (OTA) program upload when ip address changes"**

* To upload programs to an ESP32 over-the-air (OTA) when its IP address changes, the best practice is to use mDNS (Multicast DNS), which gives your device a stable hostname like `esp32.local` even if its IP changes.

* ✅ Goal
  * Wirelessly upload new firmware to your ESP32 without worrying about its dynamic IP address.

* 🧰 Requirements
  * ✅ OTA support in your sketch (`ArduinoOTA` for Arduino or `espota.py` for PlatformIO)
  * ✅ mDNS enabled (`esp32.local`)
  * ✅ ESP32 and your computer are on the same network
  * ✅ Bonjour or Avahi installed on your PC (for `.local` resolution)

* 🧪 1. Arduino OTA Example with mDNS
  * Here's a full sketch you flash once via USB to enable OTA:
```cpp
#include <WiFi.h>
#include <ArduinoOTA.h>

const char* ssid = "YOUR_WIFI_SSID";
const char* password = "YOUR_WIFI_PASSWORD";

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    Serial.println("WiFi failed, retrying...");
    delay(5000);
    ESP.restart();
  }

  // Set the mDNS hostname
  ArduinoOTA.setHostname("esp32");

  ArduinoOTA.onStart([]() {
    Serial.println("OTA Update Started");
  });

  ArduinoOTA.onEnd([]() {
    Serial.println("\nUpdate Complete");
  });

  ArduinoOTA.onError([](ota_error_t error) {
    Serial.printf("OTA Error [%u]\n", error);
  });

  ArduinoOTA.begin();
  Serial.println("OTA Ready");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  ArduinoOTA.handle();
}
```
  * 🟡 Upload this once via USB.
  * It connects to Wi-Fi and advertises itself as `esp32.local`.

* 🧪 2. OTA Upload via Arduino IDE (Using Hostname)
  * 1. Open your new sketch (one you want to upload).
  * 2. Go to Tools > Port
  * 3. Look for:
```lua
esp32 at esp32.local
```
  * 4. Select it.
  * 5. Click Upload.
  * ✅ No need to enter or track the ESP32's IP address.

* 🧪 3. OTA Upload via PlatformIO with mDNS
  * In `platformio.ini`:
```ini
[env:esp32dev]
platform = espressif32
board = esp32dev
framework = arduino

upload_protocol = espota
upload_port = esp32.local
```
  * Upload with:
```bash
pio run --target upload
```
  * ✅ Again, no IP needed — `esp32.local` works even if the IP changes.

* 💡 If `.local` doesn't resolve on your OS:
  * Title: OS => Solution
  * Windows => Install [Bonjour](https://support.apple.com/en-us/106380)
  * Linux =>  Install `avahi-daemon`
  * macOS => Already supported

* 🔁 IP Fallback (Optional)
  * If mDNS isn't working, you can still:
    * 1. Print the ESP32's IP via Serial:
```cpp
Serial.println(WiFi.localIP());
```
    * 2. Manually use the IP:
      * Arduino: Select IP from port list
      * PlatformIO:
```ini
upload_port = 192.168.X.Y
```

* 🧠 Summary
  * Title: Feature => Enabled by
  * OTA upload => ArduinoOTA / `espota.py`
  * IP-independent upload => `esp32.local` via mDNS
  * Windows/macOS/Linux => Supported with mDNS tools
  * Recommended setup => Use `esp32.local` + OTA sketch

* Would you like a one-click script or GUI for managing OTA uploads via `.local`?

**ChatGPT Question: "esp32 upload program via wifi"**

* Yes, you can upload code to an ESP32 over Wi-Fi, which is incredibly useful for wireless development or when your ESP32 is embedded in a hard-to-reach location.

* This is done using Over-the-Air (OTA) updates. Here's a breakdown of how it works and how to set it up:

* 🚀 What Is OTA (Over-the-Air) Programming?
  * OTA allows you to:
    * Wirelessly upload new firmware to your ESP32
    * Avoid physical USB connections after initial setup
    * Update firmware remotely

* ✅ Requirements
  * ESP32 board
  * Arduino IDE (or PlatformIO)
  * Initial USB connection for the first flash
  * Wi-Fi access (ESP32 and your PC on the same network)

* 🧰 Setup Guide (Arduino IDE)

  * 1. Install ESP32 board support
  * If you haven't already:
    * 1. Open Arduino IDE
    * 2. Go to `File > Preferences`
    * Add this to Additional Board URLs:
```bash
https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json
```
    * 3. Go to `Tools > Board > Boards Manager`
    * Install ESP32 by Espressif Systems

  * 2. Upload OTA-Enabled Sketch (Initial Flash)
    * You must upload this once via USB to enable OTA.
```cpp
#include <WiFi.h>
#include <ArduinoOTA.h>

const char* ssid = "Your_SSID";
const char* password = "Your_PASSWORD";

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    Serial.println("Connection Failed! Rebooting...");
    delay(5000);
    ESP.restart();
  }

  ArduinoOTA.setHostname("esp32-ota");

  ArduinoOTA.onStart([]() {
    Serial.println("Start updating...");
  });

  ArduinoOTA.onEnd([]() {
    Serial.println("\nUpdate finished!");
  });

  ArduinoOTA.onError([](ota_error_t error) {
    Serial.printf("OTA Error [%u]: ", error);
  });

  ArduinoOTA.begin();

  Serial.println("Ready for OTA");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  ArduinoOTA.handle();
}
```
    * Upload this over USB. Once done, the ESP32 will connect to Wi-Fi and be ready for OTA updates.

  * 3. Upload New Code Over Wi-Fi
    * Once your ESP32 is running the OTA sketch:
    * 1. Open your next sketch (new firmware)
    * 2. In Tools > Port, you should now see something like:
```scss
esp32-ota at xxx.xxx.xxx.xxx (ESP32 Dev Module)
```
    * 3. Select it and upload as usual. It will send code via Wi-Fi!

* 🧪 Optional: Use mDNS (Friendly Hostname)
  * The `ArduinoOTA.setHostname("your-device-name")` line lets you find your ESP32 by name like:
```arduino
http://esp32-ota.local
```
  * (Useful for multiple devices.)

* 💡 Tips
  * Always include `ArduinoOTA.handle()` in `loop()` or OTA won't work.
  * OTA sketch must already be running for OTA uploads to work.
  * Your PC and ESP32 must be on the same Wi-Fi network/subnet.

* 🧱 PlatformIO (Optional)
  * If you're using PlatformIO:
    * 1. Install the OTA-enabled sketch via USB.
    * 2. Add this to `platformio.ini`:
```ini
upload_protocol = espota
upload_port = esp32-ota.local
```
    * Then run:
```bash
pio run --target upload
```

* 📌 Summary
  * Title: Step => Action
  * 🔌 Initial Setup => Upload OTA sketch via USB
  * 📡 Enable OTA => Use `ArduinoOTA.begin()` and `ArduinoOTA.handle()`
  * 🖥 Upload via Wi-Fi => Use Arduino IDE with OTA port selected
  * 🛠 Debug => Use serial logs to check Wi-Fi/OTA status

* Would you like a ready-to-run sketch template or a script to scan for OTA devices on your network?

## ESP32 Web Server (Fixed Domain-Name.local)

* When ESP32 is connected to broadband wifi router, then IP address is changed during connection/re-connection, unless IP address is reserved in router's admin panel.

* To solve this issue, use fixed local domain name. <sup>{18}: ESP32 DHT Web Server Project</sup>
  * Use library `#include <ESPmDNS.h>`
  * Domain name setup code is:
```cpp
void setup(void) {
//....................................................
  if (MDNS.begin("esp32")) {
    Serial.println("MDNS responder started");
  }
//....................................................
}
```

* Full program of fixed local domain name:
```cpp
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <DHT.h>

const char *ssid = "My-Network";
const char *password = "chaker123456";

WebServer server(80);
DHT dht(26, DHT11);

void handleRoot() {
  char msg[1500];

  snprintf(msg, 1500,
           "<html>\
  <head>\
    <meta http-equiv='refresh' content='4'/>\
    <meta name='viewport' content='width=device-width, initial-scale=1'>\
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' integrity='sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr' crossorigin='anonymous'>\
    <title>ESP32 DHT Server</title>\
    <style>\
    html { font-family: Arial; display: inline-block; margin: 0px auto; text-align: center;}\
    h2 { font-size: 3.0rem; }\
    p { font-size: 3.0rem; }\
    .units { font-size: 1.2rem; }\
    .dht-labels{ font-size: 1.5rem; vertical-align:middle; padding-bottom: 15px;}\
    </style>\
  </head>\
  <body>\
      <h2>ESP32 DHT Server!</h2>\
      <p>\
        <i class='fas fa-thermometer-half' style='color:#ca3517;'></i>\
        <span class='dht-labels'>Temperature</span>\
        <span>%.2f</span>\
        <sup class='units'>&deg;C</sup>\
      </p>\
      <p>\
        <i class='fas fa-tint' style='color:#00add6;'></i>\
        <span class='dht-labels'>Humidity</span>\
        <span>%.2f</span>\
        <sup class='units'>&percnt;</sup>\
      </p>\
  </body>\
</html>",
           readDHTTemperature(), readDHTHumidity()
          );
  server.send(200, "text/html", msg);
}

void setup(void) {

  Serial.begin(115200);
  dht.begin();
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.println("");

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  if (MDNS.begin("esp32")) {
    Serial.println("MDNS responder started");
  }
  server.on("/", handleRoot);

  server.begin();
  Serial.println("HTTP server started");
}

void loop(void) {
  server.handleClient();
  delay(2);//allow the cpu to switch to other tasks
}


float readDHTTemperature() {
  // Sensor readings may also be up to 2 seconds
  // Read temperature as Celsius (the default)
  float t = dht.readTemperature();
  if (isnan(t)) {    
    Serial.println("Failed to read from DHT sensor!");
    return -1;
  }
  else {
    Serial.println(t);
    return t;
  }
}

float readDHTHumidity() {
  // Sensor readings may also be up to 2 seconds
  float h = dht.readHumidity();
  if (isnan(h)) {
    Serial.println("Failed to read from DHT sensor!");
    return -1;
  }
  else {
    Serial.println(h);
    return h;
  }
}
```

# References

* next-sl: {19}

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
  * {18} [ESP32 For Beginners BY DIY TechRush => PlayList](https://www.youtube.com/playlist?list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd)
  * [ESPNOW using ESP32 BY techiesms => PlayList](https://www.youtube.com/playlist?list=PLruzZCuhcsGOt7oAw01aM4fiHPyfv7Fx3)
  * [Arduino To ESP32: How to Get Started! BY Robonyx](https://www.youtube.com/watch?v=RiYnucfy_rs)
  * [ESP32 বোর্ডকে আরডুইনোর মতো ব্যবহার করুন | ESP32 Expansion Board BY Naba Tech World](https://www.youtube.com/watch?v=08cGLrtxiQ4)

* ESP32 `Over-the-Air (OTA)` Program Upload
  * [ESP32 OTA Update Using Arduino IDE – Upload Code Over Wi-Fi 🚀| Hindi BY TFK ioT](https://www.youtube.com/watch?v=G1w79miPdaw)

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

* Arduino Components, Sensors => Relay, Serve-Motor
  * {3} [Arduino Bangla Tutorial Part - 20: What is Relay? How to control AC load using Relay with Arduino? BY Naba Tech World](https://www.youtube.com/watch?v=q8tqDCRmIhg&list=PL7euiE97qGc0QbibUmHn5MBrF2V7w3NDa&index=21)
  * {4} [Arduino Bangla Tutorial Part - 24: What is Servo Motor? How to use Servo Motor with Arduino BY Naba Tech World](https://www.youtube.com/watch?v=TaFBqZFUTLE&list=PL7euiE97qGc0QbibUmHn5MBrF2V7w3NDa&index=25)
