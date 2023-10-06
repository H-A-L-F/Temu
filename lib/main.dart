import 'package:flutter/material.dart';
import 'package:temu/const/app_color.dart';
import 'package:temu/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:temu/screens/discover/discover_screen.dart';
import 'package:temu/screens/home/home_screen.dart';
import 'package:temu/screens/profile/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ScreenBase(),
  ));
}

class ScreenBase extends StatefulWidget {
  const ScreenBase({super.key});

  @override
  State<StatefulWidget> createState() => _ScreenBaseState();
}

class _ScreenBaseState extends State<ScreenBase> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'lib/assets/temu_app_logo.png',
                width: 40,
                height: 40,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Temu',
              style: TextStyle(
                color: Color(
                  AppColor.text,
                ),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            )
          ],
        ),
        backgroundColor: const Color(AppColor.secondary),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(AppColor.secondary),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(AppColor.accent),
            ),
            tooltip: 'Navigate to home screen',
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color(AppColor.accent),
            ),
            tooltip: 'Navigate to search screen',
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(AppColor.accent),
            ),
            tooltip: 'Navigate to profile screen',
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
