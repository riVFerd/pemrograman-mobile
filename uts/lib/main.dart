import 'package:flutter/material.dart';
import 'package:uts/screens/history_tab_screen.dart';
import 'package:uts/screens/home_tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static const tabScreens = [
    HomeTabScreen(),
    HistoryTabScreen(),
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyApp.tabScreens[_tabIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {},
          child: const Icon(
            Icons.qr_code,
            color: Colors.white,
            size: 32,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _tabIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.analytics,
              ),
              label: 'Pay',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Payment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            if (index > 1) return;
            setState(() => _tabIndex = index);
          },
        ),
      ),
    );
  }
}
