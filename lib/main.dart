import 'package:flutter/material.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';
import 'settings_screen.dart';
import 'sidebar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('F150 Dashboard');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(const Size(1920, 1200));
  }

  runApp(CarDashApp());
}

void setAppWindowSize(bool portrait) {
  if (!Platform.isWindows) return; // only works on desktop

  const width = 1800;
  const height = 1200;
  final size = portrait ? Size(height.toDouble(), width.toDouble()) : Size(width.toDouble(), height.toDouble());

  setWindowFrame(Rect.fromLTWH(100, 100, size.width, size.height));
}

class CarDashApp extends StatelessWidget {
  const CarDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Dashboard',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.grey[900],
      ),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatefulWidget {
  static const double sidebarWidth = 100;

  const DashboardScreen({super.key});
  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  bool isPortrait = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            if (!isPortrait) ...[
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: DashboardScreen.sidebarWidth,
                      color: Colors.grey[900],
                      child: Sidebar(isPortrait: false),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TopBar(),
                          Expanded(child: AppGrid(columns: 4)),
                          BottomBar(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              TopBar(),
              Expanded(child: AppGrid(columns: 2)),
              Sidebar(isPortrait: true),
              BottomBar(),
            ],
          ],
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: FloatingActionButton.small(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              setState(() => isPortrait = !isPortrait);
              setAppWindowSize(isPortrait);
            },
            child: const Icon(Icons.screen_rotation),
          ),
        ),
      ],
    );
  }
}

// Top bar with title, data, icons, clock
class TopBar extends StatefulWidget {
  const TopBar({super.key});
  @override
  TopBarState createState() => TopBarState();
}

class TopBarState extends State<TopBar> {
  String _time = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    Future.delayed(Duration.zero, () async {
      while (mounted) {
        await Future.delayed(Duration(seconds: 60));
        _updateTime();
      }
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _time = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey[850],
      child: Row(
        children: [
          Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 14)),
          Spacer(),
          Text('132 MB', style: TextStyle(color: Colors.white, fontSize: 12)),
          SizedBox(width: 12),
          Icon(Icons.bluetooth, color: Colors.white, size: 24),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.white, size: 24),
          SizedBox(width: 12),
          Text(_time, style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}

const List<AppItem> appItems = [
  AppItem('Spotify', Icons.music_note, 'https://open.spotify.com'),
  AppItem('Apple Music', Icons.library_music, 'https://music.apple.com'),
  AppItem('SoundCloud', Icons.audiotrack, 'https://soundcloud.com'),
  AppItem('Google Maps', Icons.map, 'https://maps.google.com'),
  AppItem('Offline Maps', Icons.folder, ''),
  AppItem('All Apps', Icons.apps, ''),
  AppItem('WLED Control', Icons.lightbulb, 'http://192.168.4.1'),
  AppItem('Voice Cmd', Icons.mic, ''),
];

class AppGrid extends StatelessWidget {
  final int columns;

  const AppGrid({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      crossAxisCount: columns,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1,
      physics: const NeverScrollableScrollPhysics(),
      children: appItems.map((item) => _AppTile(item: item)).toList(),
    );
  }
}




class AppItem {
  final String title;
  final IconData icon;
  final String url;
  const AppItem(this.title, this.icon, this.url);
}

class _AppTile extends StatelessWidget {
  final AppItem item;
  const _AppTile({required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.url.isNotEmpty) Process.runSync('cmd', ['/c', 'start', item.url]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: Colors.white, size: 40),
            SizedBox(height: 6),
            Text(item.title,
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// Bottom bar with expand button
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.grey[850],
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.expand_less, color: Colors.white, size: 24),
          onPressed: () {},
        ),
      ),
    );
  }
}