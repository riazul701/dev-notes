# Remotely-On-Off-PC.md

## Notes

* Laptops don’t power on automatically when AC power is restored, unlike desktop PCs.

* Check Wifi Plug/Socket Before Buying => Connect wifi smart socket to broadband internet and connect android phone to sim internet. Then try to remotely on/off wifi smart socket. Also check wifi plug/socket has physical button, that works without internet like normal switch.

* Check Some Wifi Plug/Socket Works As Timer Switch/Socket

* Check Timer Switch/Socket Before Buying => Check timer switch/socket has physical bypass button, so that wifi router can be turned on manually outside of timing. Check battery is replaceable. Also check it supplies power to wifi router, when there is no battery or battery is down.

* Use Motherboard BIOS/UEFI "Restore AC Power Loss" function and Sonoff Wifi Smart Plug (Switch/Socket) to remotely turn on PC. <sup>{1} {2} {3}</sup>

* Motherboard BIOS/UEFI power management functions (turn on computer)
  * Press "F2/Del/Esc" during computer starting to enter BIOS/UEFI settings -> Advanced -> APM (Advanced Power Management) --OR-- ACPI (Advanced Configuration and Power Interface)
  * "Restore AC Power Loss"
  * "Power On by PCI-E"
  * "Power On by RTC (Real-Time Clock)"

* Use Digital Timer Switch/Socket to timely on/off Wifi Router. <sup>{6}</sup>
  * SONOFF S26 R2 WiFi Smart Plug => Set scheduled/countdown/loop timers to turn on/off your devices at a specified  time. <sup>{7}</sup>

* Remote USB Insert/Attach
  * Wi-Fi USB switch/relay is for remotely turn on/off portable hard disk. Must check "data support".
  * USB-over-IP hub or USB device server
  * [SONOFF Micro Zigbee USB Smart Adaptor](https://sonoff.tech/products/sonoff-micro-zigbee-usb-smart-adaptor)

* Laptop
  * No "Restore AC Power Loss" function
  * Smart Button Presser(Pusher)/SwitchBot, check internet (another wifi/sim) controlled not bluetooth - Alternative, physically press power button
    * [SwitchBot Bot](https://www.switch-bot.com/products/switchbot-bot)

## DIY Smart Button Presser(Pusher) <sup>ChatGPT</sup>

* When wifi smart plug/socket is turned on, then wait 5 seconds before pressing laptop's power button. Because laptop's charger should provide electricity before pressing power button.

* Software Required
  * [Arduino IDE](https://www.arduino.cc/en/software/#ide)
  * [Proteus Design Suite => Arduino Simulation](https://www.labcenter.com/)

* Arduino Information
  * Arduino has several versions: Uno, Nano, Mega 2560, Leonardo, Micro. "Arduino Uno" version is used for most of the works. <sup>{8}</sup>
  * [Arduino Uno R3 SMD Development Board with USB Cable for Projects](https://bigyanproject.com/en/arduino/arduino-uno-smd)

* Servo Motor Information
  * Power servo motor from Arduino
  * Power a small servo motor with a mobile charger
  * [SG90 Micro Servo Motor 180 Degree => Contains arduino and servo motor short video overview](https://bigyanproject.com/en/servo/sg90-micro-servo-motor)
  * [MG995 360 Degree Metal Gear Servo Motor – High Torque => Not needed for button presser/pusher](https://bigyanproject.com/en/servo/mg995-servo-motor-360-metal)

**ChatGPT Question: "diy servo motor button presser"**

* Great! A DIY servo motor button presser is a relatively simple and useful project. You can create a device that physically presses a button using a servo motor and a microcontroller like an `ESP32`, `ESP8266`, or `Arduino`.

* What You’ll Need
  * Item => Description
  * Servo Motor (e.g. SG90) => Small, affordable, perfect for simple motion like pushing
  * Microcontroller (ESP32 / ESP8266 / Arduino Nano/Uno) => Controls the servo
  * Power Source (e.g. USB or battery pack) => Powers the setup
  * Optional: Wi-Fi or Bluetooth capability => For remote control via app or voice
  * Mounting hardware or 3D printed frame => To hold the servo in place
  * Arm or stick attached to servo horn => Acts as the “finger” to push the button

* Basic Wiring
  * For ESP32 + SG90 Servo:
```mathematica
SG90 Servo Motor:
 - Brown wire → GND
 - Red wire → 5V
 - Orange/Yellow wire → GPIO pin (e.g. D13)
```
  * Power the servo with 5V, not 3.3V — ESP32 itself can’t supply enough current, so consider external 5V if needed.

* Example Arduino Code (ESP32 / Arduino)
```cpp
#include <Servo.h>

Servo myServo;

void setup() {
  myServo.attach(13);  // Connect servo signal to GPIO 13
  myServo.write(0);    // Start in rest position
}

void loop() {
  delay(2000);         // Wait 2 seconds
  myServo.write(90);   // Push the button
  delay(1000);         // Hold it
  myServo.write(0);    // Release
  delay(10000);        // Wait 10 seconds before pressing again
}
```
  * Adjust angles (e.g. 90 and 0) to suit the range needed to push and release your specific button.

* Mounting Options
  * Use double-sided tape, hot glue, or a 3D printed bracket to secure the servo next to the button.
  * Attach a lever or finger to the servo horn — something stiff enough to press the button firmly.

* Optional: Add Remote Control
  * If you use an `ESP8266` or `ESP32`, you can:
    * Add a web server to press the button via browser
    * Integrate with Home Assistant, Alexa, or Google Home (using ESPHome or Tasmota firmware)
    * Use `Blynk`, `MQTT`, or `IFTTT` to trigger from your phone

* Upgrade Ideas
  * Feature => How
  * Schedule presses => Add RTC or time-based logic
  * Remote control => Use Wi-Fi + web server or ESPHome
  * Voice command => Link to Alexa/Google Assistant
  * Battery power => Use 18650 cells or USB power bank

* Visual Concept
  * Imagine this:
```css
[Button Panel]
   ↑
[FINGER ARM] ← Attached to
[Servo Motor] ← Mounted on a stand or surface
   ↑
[ESP32 board] ← Powers and controls the servo
```

* Would you like a diagram, 3D print model, or wiring schematic? I can generate or help you build one based on your exact button style or space constraints.

## WiFi Switch If No Internet <sup>ChatGPT</sup>

**ChatGPT Question: "ESP32 checks if one wifi does not have internet then start another"**

* Yes, this is possible! You can program the ESP32 to:
  * 1. Connect to Wi-Fi Network A
  * 2. Check if there is internet access
  * 3. If no internet → Switch to Wi-Fi Network B
  * This is useful for failover Wi-Fi scenarios — like fallback from home Wi-Fi to a mobile hotspot.

* What You'll Need
  * An ESP32 board
  * Two known Wi-Fi SSIDs and passwords (let’s call them `WiFi1` and `WiFi2`)
  * Use `WiFi.h` and HTTP client to test internet access

* How It Works
  * Try to connect to `WiFi1`
  * Once connected, ping an external server (e.g. `http://google.com`)
  * If no response (timeout/error), disconnect and try `WiFi2`

* Example Code
```cpp
#include <WiFi.h>
#include <HTTPClient.h>

const char* ssid1 = "YourWiFi1";
const char* password1 = "YourPassword1";

const char* ssid2 = "YourWiFi2";
const char* password2 = "YourPassword2";

bool checkInternetConnection() {
  HTTPClient http;
  http.begin("http://example.com"); // Use a reliable server
  int httpCode = http.GET();
  http.end();
  return (httpCode > 0);
}

bool connectToWiFi(const char* ssid, const char* password) {
  WiFi.begin(ssid, password);
  Serial.print("Connecting to ");
  Serial.println(ssid);

  unsigned long startAttemptTime = millis();
  const int timeout = 10000; // 10 seconds

  while (WiFi.status() != WL_CONNECTED && millis() - startAttemptTime < timeout) {
    delay(500);
    Serial.print(".");
  }

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("\nConnected!");
    return true;
  } else {
    Serial.println("\nFailed to connect.");
    return false;
  }
}

void setup() {
  Serial.begin(115200);

  // Try WiFi 1
  if (connectToWiFi(ssid1, password1)) {
    if (checkInternetConnection()) {
      Serial.println("WiFi1 has internet.");
      return;
    } else {
      Serial.println("WiFi1 has no internet.");
      WiFi.disconnect(true);
    }
  }

  // Try WiFi 2
  if (connectToWiFi(ssid2, password2)) {
    if (checkInternetConnection()) {
      Serial.println("WiFi2 has internet.");
      return;
    } else {
      Serial.println("WiFi2 has no internet.");
    }
  }

  Serial.println("No working Wi-Fi found.");
}

void loop() {
  // Your main code here
}
```

* Notes
  * `http.begin("http://example.com")` → use a stable server; `http://captive.apple.com` is another good one.
  * If you want to repeat this check regularly (e.g. every few minutes), put this logic in a function and call it when `WiFi.status() != WL_CONNECTED`.

* Optional Features
  * Feature => How
  * Retry periodically => Use `millis()` timer or `Ticker` library
  * Reconnect on disconnect => Monitor `WiFi.status()` in `loop()`
  * Use ESP32's multiple Wi-Fi support => ESP32 only connects to one network at a time; you must disconnect manually
  * Save preferred network => Use `Preferences` library or `EEPROM`

* Would you like me to modify this code to automatically switch back to WiFi1 if it becomes available again later?

## Timely Provide Water In Garden <sup>ChatGPT</sup>

**ChatGPT Question: "use arduino to timely provide water in garden"**

* You can absolutely use an Arduino to create a simple automatic garden watering system! It’s a classic and highly practical project.

* What You Can Build
  * An Arduino-based timed watering system that:
    * Turns on a water pump or valve at a set time
    * Waters the garden for a fixed duration
    * Repeats daily (or multiple times per day)
    * Optionally uses a soil moisture sensor or `RTC (real-time clock)` for smarter control

* Basic Components (Minimal Timed Version)
  * Component => Purpose
  * Arduino Uno/Nano => Controls the logic
  * Relay Module (or MOSFET) => Turns water pump/valve on/off
  * 5V/12V DC water pump or solenoid valve => Delivers water
  * Power supply (battery, adapter) => Powers pump and Arduino
  * Tubing + water container => Irrigation setup
  * (Optional) RTC module (DS3231) => Accurate timekeeping
  * (Optional) Soil moisture sensor => Water only when dry

* Sample Code: Simple Timed Watering (No RTC, Fixed Intervals)
  * This code will water for 10 seconds every hour (customizable):
```cpp
const int pumpPin = 8; // Connected to relay IN pin
unsigned long lastWatered = 0;
const unsigned long interval = 3600000UL; // 1 hour in milliseconds
const unsigned long wateringDuration = 10000UL; // 10 seconds

void setup() {
  pinMode(pumpPin, OUTPUT);
  digitalWrite(pumpPin, LOW); // Relay OFF
}

void loop() {
  unsigned long currentMillis = millis();

  if (currentMillis - lastWatered >= interval) {
    digitalWrite(pumpPin, HIGH); // Turn on pump
    delay(wateringDuration);     // Wait
    digitalWrite(pumpPin, LOW);  // Turn off pump

    lastWatered = currentMillis;
  }
}
```
  * This version runs from startup, but millis() resets on power loss, and there’s no real-time tracking.

* Improved Version: Add Real-Time Clock (RTC)
  * Add a DS3231 RTC module so Arduino knows the actual time of day (e.g. water at 6:00 AM daily).
  * Bonus:
    * RTC remembers time even after power loss
    * You can schedule based on actual hours
  * Would you like this version with RTC? I can give you full code with time-based scheduling.

* Optional: Add Soil Moisture Sensor
  * Water only if the soil is dry:
    * 1. Connect analog soil moisture sensor
    * 2. Read value (e.g., dry = >700)
    * 3. Water only if dry and time is right

* Safety and Practical Tips
  * Tip => Why
  * Use flyback diode on relay/pump => Protects Arduino from voltage spikes
  * Use external power for pump => Don't overload Arduino's 5V pin
  * Use waterproof enclosure => For outdoor setup
  * Use a 12V solenoid valve => If using tap water pressure

* Summary
  * Want this? => Use this:
  * Timed watering (simple) => Arduino + relay + delay logic
  * Precise daily watering => Add RTC (DS3231)
  * Smart watering => Add soil sensor
  * Remote control => Add ESP32/Wi-Fi/Bluetooth later

* Would you like a full wiring diagram, RTC-based version, or an ESP32 Wi-Fi controlled version? Just let me know!

# Auto Login OS

## Linux

* For LXDE desktop environment, display manager is `/var/lib/lxdm` <sup>{4} {5}</sup>
  * Autologin : To log in to one account automatically on startup, without providing a password, find the line in `/etc/lxdm/lxdm.conf` that looks like this: `#autologin=dgod`. Uncomment it, substituting the target user instead of `dgod`. <sup>{5}</sup>

# References

* next-sl: {9}

## Tutorials

* {1} [[Motherboard]BIOS item-Restore AC Power Loss function => ASUS Desktop and Laptop](https://www.asus.com/support/faq/1049855/)

* Linux Desktop Environment
  * {4} [LXDE => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDE)
  * {5} [LXDM => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDM)

## Products

* {7} [SONOFF S26 R2 WiFi Smart Plug Wireless Wifi Outlet Socket Remote Control Wall Plug Alexa Google](https://www.daraz.com.bd/products/sonoff-r2-wifi-wifi-i274335274-s1249615976.html)

## YouTube Tutorials

* General
  * {2} [Remotely TURN ON and Connect To Your Computer EASIEST METHOD BY GPUSpecs](https://www.youtube.com/watch?v=-eqr4jkpI3I)
  * {3} [এটা দিয়ে সবই হবে স্মার্ট ডিভাইস! // Sonoff Wifi Smart Plug Review & Setup BY Gadget Insider Bangla](https://www.youtube.com/watch?v=kw82UXblSIo)
  * {6} [ডিজিটাল টাইমার সুইচ! // Digital Timer Switch | Automatic Switching Device! BY Gadget Insider Bangla](https://www.youtube.com/watch?v=EhNJbwZ-NqU)

* Arduino, Servo-Motor
  * {8} [Arduino Bangla Tutorial BY Naba Tech World => PlayList](https://www.youtube.com/playlist?list=PL7euiE97qGc0QbibUmHn5MBrF2V7w3NDa)
