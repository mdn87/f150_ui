
# F150 Flutter Dashboard

> A unified in-car interface built with Flutter, replacing a tablet head unit on Windows/Surface Go devices.

---

## 📋 Table of Contents

* [Overview](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#overview)
* [Features](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#features)
* [Tech Stack](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#tech-stack)
* [Hardware Requirements](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#hardware-requirements)
* [Getting Started](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#getting-started)
  * [Prerequisites](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#prerequisites)
  * [Installation](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#installation)
  * [Configuration](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#configuration)
  * [Running the App](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#running-the-app)
* [Roadmap](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#roadmap)
* [Contributing](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#contributing)
* [License](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/68479134-79a8-8000-a3e9-1cf1efcfaab1#license)

---

## 🔍 Overview

**Flutter Car Dashboard** is a personal, single-contributor project that transforms a Windows/Surface Go tablet into a touch-optimized car head unit. It centralizes vehicle OS controls, media playback, navigation, LED lighting, and Helix DSP integration into one cohesive interface.

---

## ✨ Features

* **OS Controls**
  * Wi-Fi on/off & status
  * Bluetooth pairing & auto-reconnect
  * Screen brightness slider
* **Startup & Performance**
  * Auto-launch on boot
  * Splash/loading indicator
  * Init-time instrumentation & logs
* **Media Playback**
  * Spotify “Car Mode” via Web API & OAuth2
  * Large touch controls, metadata & album art
  * Playback callbacks & error handling
* **Navigation**
  * Destination input & route planning
  * Live GPS tracking & turn-by-turn directions
  * Map rendering (Google Maps or Mapbox)
* **LED Lighting (WLED)**
  * mDNS/UDP discovery of WLED devices
  * On/off, brightness, color picker & presets
  * REST/WebSocket control & local preset storage
* **Helix DSP Mini MK2**
  * Fast-load preset workflows
  * Preset organization, preview & metadata display
  * USB-MIDI/Ethernet control service

---

## 🛠 Tech Stack

* **Framework:** Flutter & Dart
* **State Management:** Riverpod (or Provider)
* **Persistence:** Hive (or local JSON files)
* **Connectivity & Hardware:**
  * `connectivity_plus` (Wi-Fi)
  * `flutter_blue` or `blue` (Bluetooth)
  * `screen_brightness` (Display)
* **APIs & Networking:**
  * `http` or `dio` (REST)
  * `web_socket_channel` (WebSockets)
* **Maps & Location:**
  * `google_maps_flutter` or Mapbox SDK
  * `geolocator` (GPS)
* **LED Control:** WLED JSON REST & WebSocket protocol
* **DSP Control:** Custom Dart USB/Ethernet service

---

## 🔧 Hardware Requirements

* Windows 10/11 tablet (e.g. Surface Go)
* USB-MIDI (or Ethernet) access for Helix DSP Mini MK2
* WLED-compatible LED controller on local Wi-Fi

---

## 🚀 Getting Started

### Prerequisites

* Install the [Flutter SDK](https://flutter.dev/) (version 3.x or later)
* Enable Windows desktop support:
  ```bash
  flutter config --enable-windows-desktop
  ```
* Have a connected device or emulator (Surface Go, Windows desktop, etc.)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/flutter-car-dashboard.git
   cd flutter-car-dashboard
   ```
2. **Fetch dependencies**
   ```bash
   flutter pub get
   ```

### Configuration

1. Copy `lib/config_example.dart` → `lib/config.dart`
2. Update `lib/config.dart` with:
   * Spotify Client ID & Secret
   * WLED discovery settings
   * Helix DSP connection parameters

### Running the App

* **Default device**
  ```bash
  flutter run
  ```
* **Target Windows desktop**
  ```bash
  flutter run -d windows
  ```
* **Hot reload:** Press `r` in the console
* **Hot restart:** Press `R`

---

## 🗺 Roadmap

See our [GitHub Project Board](https://github.com/%3Cyour-username%3E/flutter-car-dashboard/projects/1) for epics, features, and status.

---

## 🤝 Contributing

This is a personal project. Issues and pull requests are welcome.

---

## ⚖️ License

Distributed under the MIT License. See [LICENSE](https://chatgpt.com/g/g-p-683a9b44dea8819197044df24ece7a34-flutter-car-dashboard/c/LICENSE) for details.
