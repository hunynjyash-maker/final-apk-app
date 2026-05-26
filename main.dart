import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MainApp(), debugShowCheckedModeBanner: false));

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _tab = 0;
  final List<Widget> _pages = [const HomeP(), const ChaptersP(), const SubsP(), const SupportP()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_tab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tab,
        selectedItemColor: Colors.teal,
        onTap: (i) => setState(() => _tab = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'الفصول'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology), label: 'البدائل'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'الدعم'),
        ],
      ),
    );
  }
}
