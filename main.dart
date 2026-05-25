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

// 1. الرئيسية
class HomeP extends StatelessWidget {
  const HomeP({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('خُدعة الواقع'), backgroundColor: Colors.teal),
    body: const Center(child: Text('ابدأ رحلة التحرر من الإدمان\nبكل هدوء وذكاء.', textAlign: TextAlign.center, style: TextStyle(fontSize: 22))),
  );
}

// 2. الفصول
class ChaptersP extends StatelessWidget {
  const ChaptersP({super.key});
  final List<Map<String, String>> data = const [
    [span_0](start_span){"title": "الفصل الأول: كشف الخدعة", "content": "مواجهة الحقيقة: أنت لست ضعيفاً، أنت واقع في خدعة.. الإدمان هو ظل يلاحق يومك[span_0](end_span)."},
    [span_1](start_span){"title": "الفصل الثاني: هندسة الهدم", "content": "قانون الـ 20%: اخصم 20% من الكمية أسبوعياً لتخادع دماغك وتتحرر بلا ألم[span_1](end_span)."},
    {"title": "الفصل الثالث: التحرر والبدائل", "content": "استبدل 'السموم' ببدائل صحية. [span_2](start_span)تذكر أن المتعة التي تظنها هي مجرد تسكين لألم الإدمان نفسه[span_2](end_span)."},
    {"title": "الفصل الرابع: الحصن المنيع", "content": "لا تلتفت للحنين الكاذب، فهو حنين السجين لزنزانته. [span_3](start_span)أنت الآن مهندس قبة حرة في دماغك[span_3](end_span)."},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('فصول الكتاب'), backgroundColor: Colors.teal),
    body: ListView.builder(itemCount: data.length, itemBuilder: (c, i) => Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(title: Text(data[i]["title"]!), onTap: () => _openPage(c, data[i]["title"]!, data[i]["content"]!)),
    )),
  );
  void _openPage(c, title, content) => Navigator.push(c, MaterialPageRoute(builder: (_) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Text(content, style: const TextStyle(fontSize: 18))),
  )));
}

// 3. البدائل
class SubsP extends StatelessWidget {
  const SubsP({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('البدائل الذكية'), backgroundColor: Colors.teal),
    body: ListView(children: const [
      [span_4](start_span)ExpansionTile(title: Text("البديل النفسي"), children: [Padding(padding: EdgeInsets.all(15), child: Text("تنفس بعمق، اكتب شعورك في ورقة، أو استمع لصوت طبيعي لتفكيك مسمار التوتر[span_4](end_span)."))]),
      [span_5](start_span)ExpansionTile(title: Text("البديل الجسدي"), children: [Padding(padding: EdgeInsets.all(15), child: Text("اشرب كوب ماء بارد، اغسل وجهك، أو مارس المشي السريع لقطع حبل الإدمان[span_5](end_span)."))]),
    ]),
  );
}

// 4. الدعم
class SupportP extends StatelessWidget {
  const SupportP({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('رسائل الدعم'), backgroundColor: Colors.teal),
    body: const Center(child: Padding(padding: EdgeInsets.all(20), child: Text("أنت لست ضعيفاً، أنت بطل في مرحلة الاستيقاظ. كل لحظة تقاوم فيها هي مسمار إضافي في نعش هذه الخدعة!", textAlign: TextAlign.center, style: TextStyle(fontSize: 20)))),
  );
}
