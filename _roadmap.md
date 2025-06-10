# Car Dashboard Roadmap & Checklist

## 1. Integrate OS Functionality

- [ ] Add `connectivity_plus` to read/manage Wi-Fi state
- [ ] Add `screen_brightness` plugin to get/set display level
- [ ] Expose toggles/sliders in Settings UI and persist choices

## 2. Startup & Load-Time Analysis

- [ ] Auto-launch on boot (Windows Startup folder or registry)
- [ ] Implement splash/loading indicator and timestamp startup → ready
- [ ] Log init times for core services (theme, data, plugins)

## 3. Spotify Integration

- [ ] Research Flutter Spotify SDK or Web API + OAuth2 flow
- [ ] Build login flow, securely store & refresh tokens
- [ ] Create Car-Mode playback screen (▶️ ⏸️ ⏭️, volume, album art)
- [ ] Handle playback callbacks and error states

## 4. Maps & Directions

- [ ] Choose a maps SDK (`google_maps_flutter` or Mapbox)
- [ ] Request location permission & stream GPS (`geolocator`)
- [ ] Design destination input + “Start Navigation” button
- [ ] Render turn-by-turn directions and live map updates

## 5. Bluetooth Pairing

- [ ] Add a Flutter Bluetooth package (`flutter_blue` or `blue`)
- [ ] Request Bluetooth permissions on Windows/Surface Go
- [ ] Scan for nearby devices and show pairing list in UI
- [ ] Implement pairing/unpairing flows and connection state
- [ ] Persist paired-device info and auto-reconnect on startup

## 6. LED Light Controls (WLED)

- [ ] Integrate WLED REST API or WebSocket client in Dart
- [ ] Detect WLED device on local Wi-Fi (mDNS/UDP discovery)
- [ ] Build UI for on/off, brightness slider, color picker, presets
- [ ] Wire up HTTP calls to `/json` endpoints (or WS commands)
- [ ] Persist user-defined light presets locally (JSON or Hive)
- [ ] Handle network errors and show connection status

## 7. Helix DSP Mini MK2 Integration

- [ ] Research Helix Mini MK2 control interfaces (USB MIDI, Ethernet, or proprietary API)
- [ ] Prototype a Dart service to connect & send preset-load commands
- [ ] Define a data model for presets/configurations (name, file path, metadata)
- [ ] Create UI to browse, preview, and select DSP presets quickly
- [ ] Store presets in a structured directory (`/assets/presets` or local storage)
- [ ] Implement fast-load logic (pre-cache, background fetch)
- [ ] Display current preset name/parameters on the dashboard
- [ ] Add error-handling and user feedback for load failures

---

> _Feel free to split any of these into smaller sub-tasks as you start working on them!_
>
