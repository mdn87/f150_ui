import 'package:flutter/material.dart';
import 'main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black, // match your theme
      ),
      body: ListView(
        children: [
          _buildSettingsTile(
            icon: Icons.wifi,
            label: 'Wi-Fi',
            onTap: () {
              // Push Wi-Fi config page (to be built)
            },
          ),
          _buildSettingsTile(
            icon: Icons.bluetooth,
            label: 'Bluetooth',
            onTap: () {
              // Push Bluetooth page
            },
          ),
          _buildSettingsTile(
            icon: Icons.brightness_6,
            label: 'Display Brightness',
            onTap: () {
              // Show brightness slider dialog
            },
          ),
          _buildSettingsTile(
            icon: Icons.cloud_off,
            label: 'Offline Mode',
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          _buildSettingsTile(
            icon: Icons.brightness_2,
            label: 'Dark Theme',
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          _buildSettingsTile(
            icon: Icons.info,
            label: 'About',
            onTap: () {
              // Show about dialog
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, size: 32, color: Colors.white),
      title: Text(
        label,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      trailing: trailing,
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      tileColor: Colors.grey[900], // or whatever matches your theme
    );
  }
}