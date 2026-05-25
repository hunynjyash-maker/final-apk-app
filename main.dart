import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MainScreen(), debugShowCheckedModeBanner: false));

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  final List<Widget> _pages = [const HomeScreen(), const ChaptersScreen(), const SubstitutesScreen(), const SupportScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedItemColor: Colors.teal,
        onTap: (i) => setState(() => _index = i),
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

// 1. الرئيسية
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تطبيق النجار'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: const Center(child: Text('مرحباً بك في طريق التعافي.\nابدأ رحلتك من الفصول بالأسفل.', textAlign: TextAlign.center, style: TextStyle(fontSize: 20))),
    );
  }
}

// 2. الفصول
class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({super.key});
  final Map<String, String> chapters = const {
    "الفصل الأول": "فهم المحفزات: العادة تبدأ بمثير. حدد المثيرات التي تدفعك للعادة القديمة وتجنبها.",
    "الفصل الثاني": "البدائل السلوكية: عندما يظهر المثير، استبدل العادة فوراً بنشاط بديل لمدة 5 دقائق.",
    "الفصل الثالث": "نظام الدعم: لا تكن وحيداً. شارك تقدمك مع صديق تثق به أو معالج مختص.",
    "الفصل الرابع": "الاستدامة: الصبر هو مفتاح النجاح. كل يوم يمر هو انتصار جديد لك.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المنهجية'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: ListView(children: chapters.keys.map((title) => ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => showDialog(context: context, builder: (_) => AlertDialog(title: Text(title), content: Text(chapters[title]!))),
      )).toList()),
    );
  }
}

// 3. البدائل
class SubstitutesScreen extends StatelessWidget {
  const SubstitutesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البدائل'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: Column(children: [
        ListTile(title: const Text("البديل النفسي"), onTap: () => _show(context, "تنفس بعمق 10 مرات، اكتب شعورك في ورقة، أو استمع لصوت طبيعي.")),
        ListTile(title: const Text("البديل الجسدي"), onTap: () => _show(context, "اشرب كوباً كبيراً من الماء، اغسل وجهك بماء بارد، أو مارس المشي السريع.")),
      ]),
    );
  }
  void _show(context, msg) => showDialog(context: context, builder: (_) => AlertDialog(content: Text(msg)));
}

// 4. الدعم
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدعم'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: Center(child: ElevatedButton(
        onPressed: () => showDialog(context: context, builder: (_) => const AlertDialog(title: Text('طوارئ'), content: Text('أنت أقوى من هذه الرغبة. اتصل بصديقك الآن!'))),
        child: const Text('طلب مساعدة فورية'),
      )),
    );
  }
}
