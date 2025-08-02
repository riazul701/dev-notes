# Serial Communication And Monitor

## Notes

* For serial communication between two devices, same `baud` rate is must. <sup>{18}: ESP32 Web Server</sup>

* To discover ESP32 using `domain-name.local` instead of changing IP address in local wifi, there must be `mDNS (Multicast DNS)` feature in wifi router. <sup>ChatGPT: esp32 serial communation using local wifi when ip address changes</sup>
  * Tips for Reliability
  * Ensure your Wi-Fi router supports mDNS (Multicast DNS).
  * Make sure firewalls don’t block port `5353` (used by mDNS).
  * Avoid port conflicts — use another port like `2323` if needed (inside ESP32 program).

## Serial Communication Using USB

**Serial Communication Via USB**

## Serial Communication Using Fixed Domain-Name.local Via Wifi (ESP32)

**ChatGPT Question: "esp32 serial communation using local wifi when ip address changes"**

* To enable serial-style communication with an ESP32 over local Wi-Fi, even when its IP address changes, the most robust solution is to use mDNS and a TCP server on the ESP32. This lets you connect using a hostname like `esp32.local` instead of tracking a changing IP address.

* ✅ Objective
  * Set up an ESP32 to communicate over local Wi-Fi without needing to know its current IP address — using a stable hostname like `esp32.local`.

* 🧰 What You’ll Need
  * Title: Item => Purpose
  * ESP32 board => Wi-Fi-capable microcontroller
  * mDNS support => To resolve `.local` domain names
  * TCP server => So your PC can talk to the ESP32 over Wi-Fi
  * telnet/netcat => To connect from your PC

* 🧪 1. ESP32 Sketch Using mDNS + TCP Serial Bridge
```cpp
#include <WiFi.h>
#include <ESPmDNS.h>

const char* ssid = "YourWiFiName";
const char* password = "YourWiFiPassword";

WiFiServer server(23);  // Telnet-style serial bridge

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("\nConnected to Wi-Fi");

  if (!MDNS.begin("esp32")) {
    Serial.println("Error starting mDNS");
    while (1);  // Stop if mDNS fails
  }
  Serial.println("mDNS responder started: esp32.local");

  server.begin();
  Serial.println("TCP Server started on port 23");
}

void loop() {
  WiFiClient client = server.available();
  if (client) {
    Serial.println("Client connected");

    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        Serial.write(c);  // Echo to USB serial
      }

      if (Serial.available()) {
        char c = Serial.read();
        client.write(c);  // Send to TCP client
      }
    }

    client.stop();
    Serial.println("Client disconnected");
  }
}
```

* 🖥 2. Connect from Your PC Using the Hostname

  * On Linux/macOS:
    * You already have mDNS (Avahi/Bonjour) support:
```bash
telnet esp32.local 23
# or
nc esp32.local 23
```

  * On Windows:
    * Install [Bonjour Print Services](https://support.apple.com/en-us/106380) if .local hostnames don’t resolve.
```powershell
telnet esp32.local 23
```
    * ✅ No IP address needed. Even if the ESP32’s IP changes, `esp32.local` still works.

* 📡 Optional: Display IP on Serial Monitor
  * Add this to `setup()` if you want to debug:
```cpp
Serial.print("ESP32 IP address: ");
Serial.println(WiFi.localIP());
```

* 💡 Tips for Reliability
  * Ensure your Wi-Fi router supports mDNS (Multicast DNS).
  * Make sure firewalls don’t block port `5353` (used by mDNS).
  * Avoid port conflicts — use another port like `2323` if needed.

* 🧠 Alternatives (if mDNS fails)
  * Title: Method => Pros => Cons
  * Static IP => Always known address => Must hardcode network settings
  * ESP sends IP to a server => Always trackable => Requires web server or MQTT broker
  * Serial print IP => Debugging only => Useless without USB connected

* ✅ Summary
  * Title: Feature => How
  * Dynamic IP handling => Use `esp32.local` via mDNS
  * Serial-like comms => TCP server on ESP32 + telnet/nc
  * Easy connection => No need to update IP manually
  * Works across devices => Yes (Linux, macOS, Windows)

* Would you like a Python client that auto-discovers `esp32.local` and connects for you?

## Serial Communication Using Wifi (ESP32)

**ChatGPT Question: "send and receive telnet based serial from computer and android to esp32 via wifi"**

* To send and receive serial data between a computer, Android device, and an ESP32 over Wi-Fi using Telnet, you can set up a Telnet-based Serial Bridge on the ESP32.

* What You’ll Achieve
  * ESP32 acts as a Telnet server
  * You connect from:
    * PC (Windows, macOS, Linux) via Telnet/PuTTY
    * Android using a Telnet app (e.g., [JuiceSSH](https://play.google.com/store/apps/details?id=com.sonelli.juicessh) or [Termius](https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client))
  * Full bi-directional serial communication (send commands, receive responses/logs)

* ESP32 Telnet Serial Bridge Code (Arduino-compatible)
```cpp
#include <WiFi.h>

const char* ssid = "YOUR_WIFI_SSID";
const char* password = "YOUR_WIFI_PASSWORD";

WiFiServer telnetServer(23);  // Telnet port
WiFiClient telnetClient;

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("\nWiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  telnetServer.begin();
  telnetServer.setNoDelay(true);
}

void loop() {
  // Accept new client
  if (telnetServer.hasClient()) {
    if (!telnetClient || !telnetClient.connected()) {
      if (telnetClient) telnetClient.stop();
      telnetClient = telnetServer.available();
      Serial.println("New Telnet client connected");
      telnetClient.println("ESP32 Telnet Server Ready");
    } else {
      WiFiClient newClient = telnetServer.available();
      newClient.stop();  // Only allow one client
    }
  }

  // Data: PC/Phone → ESP32 Serial
  if (telnetClient && telnetClient.connected() && telnetClient.available()) {
    while (telnetClient.available()) {
      Serial.write(telnetClient.read());
    }
  }

  // Data: ESP32 Serial → PC/Phone
  if (Serial.available()) {
    while (Serial.available()) {
      telnetClient.write(Serial.read());
    }
  }
}
```

* Connect from Android
  * 1. Install Telnet app:
    * [JuiceSSH](https://play.google.com/store/apps/details?id=com.sonelli.juicessh)
    * [Termius](https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client)
    * Or any generic Telnet client

  * 2. Connect using:
    * IP address shown on ESP32 (e.g., `192.168.1.42`)
    * Port: `23`

  * 3. You should see:
```arduino
ESP32 Telnet Server Ready
```
  * You can now send commands or messages from your phone to ESP32's serial port, and view responses in real-time.

* Connect from a Computer

  * On Windows (with PuTTY or CMD):
    * Open PuTTY
      * Connection type: Telnet
      * IP address: ESP32’s IP
      * Port: `23`
    * Or in CMD:
```bash
telnet 192.168.1.42 23
```

  * On macOS/Linux:
```bash
telnet 192.168.1.42 23
```

* Tips
  * You can extend this to send AT-style commands, or control ESP32 pins from your phone.
  * Telnet is not encrypted – for security, use only on trusted LANs.
  * Only one device can be connected at a time in the current code. You can expand it to handle multiple clients if needed.

* Summary
  * Heading: Platform => Tool => Protocol => Works With Code Above?
  * Windows => PuTTY, CMD => Telnet =>  ✅ Yes
  * macOS => Terminal => Telnet => ✅ Yes
  * Linux => telnet, netcat => Telnet => ✅ Yes
  * Android =>JuiceSSH, Termius => Telnet =>  ✅ Yes

* Would you like:
  * A PlatformIO-ready version of this?
  * An extended version to support multiple clients or Web UI?
  * Commands to control GPIOs or send sensor values?

* Just say the word, and I’ll generate the full project.

**ChatGPT Question: "send and receive web based serial from computer and android to esp32 via wifi"**

* You can create a web-based serial terminal to send and receive data between your ESP32 and a computer or Android device via Wi-Fi using a browser. This avoids Telnet or USB — everything works over a web page served by the ESP32.

* ✅ What You’ll Achieve
  * ESP32 acts as a web server
  * Serves a simple HTML+JavaScript page
  * Uses WebSockets for real-time, 2-way communication
  * Works on:
    * 🖥️ Any computer (Chrome, Firefox, etc.)
    * 📱 Any Android device with a browser (no app needed)

* 🌐 ESP32 WebSocket Serial Terminal — Full Example

  * 🧱 Requirements
    * Install these libraries in Arduino IDE or PlatformIO:
      * `ESPAsyncWebServer`
      * `AsyncTCP` (for ESP32)
    * You can install them via the Library Manager (Arduino) or add to `platformio.ini`:
```ini
lib_deps =
  ESP Async WebServer
  AsyncTCP
```

* 📄 main.cpp or .ino (ESP32 code)
```cpp
#include <WiFi.h>
#include <ESPAsyncWebServer.h>
#include <AsyncTCP.h>

const char* ssid = "YOUR_SSID";
const char* password = "YOUR_PASSWORD";

AsyncWebServer server(80);
AsyncWebSocket ws("/ws");

void onWebSocketEvent(AsyncWebSocket *server, AsyncWebSocketClient *client,
                      AwsEventType type, void *arg, uint8_t *data, size_t len) {
  if (type == WS_EVT_CONNECT) {
    Serial.println("Client connected");
  } else if (type == WS_EVT_DISCONNECT) {
    Serial.println("Client disconnected");
  } else if (type == WS_EVT_DATA) {
    String msg = "";
    for (size_t i = 0; i < len; i++) {
      msg += (char)data[i];
    }
    Serial.print("From Web: ");
    Serial.println(msg);
    client->text("Echo: " + msg);
  }
}

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) delay(500);
  Serial.println("WiFi connected");
  Serial.println(WiFi.localIP());

  ws.onEvent(onWebSocketEvent);
  server.addHandler(&ws);

  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request) {
    request->send_P(200, "text/html", R"rawliteral(
<!DOCTYPE html>
<html>
<head><title>ESP32 Web Serial</title></head>
<body>
  <h2>ESP32 Web Serial</h2>
  <textarea id="output" cols="50" rows="10" readonly></textarea><br>
  <input id="input" type="text" /><button onclick="send()">Send</button>
  <script>
    const ws = new WebSocket(`ws://${location.host}/ws`);
    ws.onmessage = e => document.getElementById('output').value += e.data + '\\n';
    function send() {
      const msg = document.getElementById('input').value;
      ws.send(msg);
      document.getElementById('input').value = '';
    }
  </script>
</body>
</html>
    )rawliteral");
  });

  server.begin();
}

void loop() {
  // nothing needed here for AsyncWebServer
}
```

* 🔌 How It Works
  * ESP32 connects to Wi-Fi and starts a web server
  * You visit `http://<esp32_ip>/` in your browser
  * The page connects to ESP32 over WebSocket at `/ws`
  * Messages you type are sent to ESP32
  * ESP32 prints to Serial and echoes them back to the page

* 📱 Use on Android
  * 1. Connect your Android device to the same Wi-Fi network
  * 2. Open Chrome/Firefox
  * 3. Enter the ESP32’s IP address in the browser
  * 4. You’ll see the terminal interface
  * 5. Type and send text from Android — the ESP32 receives and responds

* 🖥️ Use on Computer
  * Same process — just open the ESP32’s IP in your desktop browser.

* ✅ Summary
  * Heading: Feature => Status
  * No app install needed => ✅
  * Works on Android => ✅
  * Works on PC/Mac/Linux => ✅
  * Real-time two-way data => ✅ (WebSocket)
  * Can be customized => ✅ (HTML/JS)

* Would you like:
  * A full downloadable PlatformIO project for this?
  * Features like GPIO control, autoscroll, or timestamped logs?

* Let me know — I can generate and explain it for you.

## Serial Communication Using Bluetooth (ESP32)

**Serial Communication Via Bluetooth**

# References

## YouTube Tutorials

* ESP32
  * {18} [ESP32 For Beginners BY DIY TechRush => PlayList](https://www.youtube.com/playlist?list=PLlLe2PpVuiVJ7bdUtQHkXIlMzqxeOtrqd)
