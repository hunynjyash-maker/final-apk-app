// هذا الجزء خاص بالفصل الأول من كتاب خُدعة الواقع
class ChapterOneContent extends StatelessWidget {
  const ChapterOneContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الفصل الأول: كشف الخدعة")),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "أنت لست ضعيفاً، ولست عاجزاً. أنت ببساطة واقع في 'خدعة'. الإدمان هو ظل يلاحق يومك، يقنعك بأن السعادة مرتبطة بهذه العادة. "
          "في هذا الفصل، نبدأ بسحب 'المسامير' التي تثبت هذا السجن. اسأل نفسك قبل كل مرة: هل أحتاج هذا فعلاً، أم أنها حركة تلقائية؟",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
