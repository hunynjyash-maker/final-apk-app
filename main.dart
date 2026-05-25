import 'package:flutter/material.dart';

void main() {
  runApp(const AlNajjarApp());
}

class AlNajjarApp extends StatelessWidget {
  const AlNajjarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق النجار',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ChaptersScreen(),
    const SubstitutesScreen(),
    const SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'المنهجية'),
          BottomNavigationBarItem(icon: Icon(Icons.cached), label: 'البدائل'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'الدعم'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _days = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرئيسية'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('أيام الالتزام: $_days', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => setState(() => _days++), child: const Text('تأكيد التزام اليوم')),
          ],
        ),
      ),
    );
  }
}

class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المنهجية'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: ListView(
        children: const [
          ListTile(title: Text('الفصل الأول: فهم المحفزات')),
          ListTile(title: Text('الفصل الثاني: البدائل السلوكية')),
          ListTile(title: Text('الفصل الثالث: نظام الدعم')),
          ListTile(title: Text('الفصل الرابع: الاستدامة')),
        ],
      ),
    );
  }
}

class SubstitutesScreen extends StatefulWidget {
  const SubstitutesScreen({super.key});
  @override
  State<SubstitutesScreen> createState() => _SubstitutesScreenState();
}

class _SubstitutesScreenState extends State<SubstitutesScreen> {
  String msg = "اختر نوع البديل:";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البدائل السلوكية'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(20), child: Text(msg, style: const TextStyle(fontSize: 18))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => setState(() => msg = "بديل نفسي: تنفس عميق"), child: const Text('نفسي')),
              ElevatedButton(onPressed: () => setState(() => msg = "بديل جسدي: شرب ماء"), child: const Text('جسدي')),
            ],
          ),
        ],
      ),
    );
  }
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدعم'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () => showDialog(context: context, builder: (_) => const AlertDialog(title: Text('بروتوكول الطوارئ'))),
          child: const Text('تفعيل الطوارئ', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
