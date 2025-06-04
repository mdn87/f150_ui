import 'package:flutter/material.dart';
import 'main.dart';
import 'settings_screen.dart';

class Sidebar extends StatelessWidget {
  final bool isPortrait;

  const Sidebar({super.key, required this.isPortrait});

  @override
  Widget build(BuildContext context) {
    final navItems = [
      _NavButton(icon: Icons.home, label: 'Home', onTap: () {}),
      _NavButton(icon: Icons.music_note, label: 'Music', onTap: () {}),
      _NavButton(icon: Icons.map, label: 'Maps', onTap: () {}),
      _NavButton(icon: Icons.lightbulb_outline, label: 'Lights', onTap: () {}),
      _NavButton(
        icon: Icons.settings,
        label: 'Settings',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        },
      ),
    ];

    return Container(
      color: Colors.grey[900],
      height: isPortrait ? 60 : double.infinity,
      width: isPortrait ? double.infinity : DashboardScreen.sidebarWidth,
      child: Flex(
        direction: isPortrait ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: navItems,
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 36),
            SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}