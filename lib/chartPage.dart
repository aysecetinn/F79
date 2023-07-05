import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

String textData = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getData(); // firebase'den veriyi çekmek için metodu çağırıyoruz
  runApp(const Chart());
}

// buradaki metod örnek olarak firebaseden veriyi çekmek için yazıldı.
// bu metod firebase'den veriyi çekip en yukarıdaki textData değişkenine atıyor.
// daha sonra ilgili değişkeni widget içerisinde kullanarak veriyor gösteriyoruz.
Future<void> getData() async {
  var db = FirebaseFirestore.instance;
  final emotions = db.collection("emotion");
  final docs = emotions.doc("xsexbUXNof6Wpx1ATWQl");
  var response = await docs.get();
  var data = response.data() as Map;
  textData = data["text"];
}

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChartPage(title: 'F79'),
    );
  }
}

class ChartPage extends StatefulWidget {
  const ChartPage({super.key, required this.title});
  final String title;

  @override
  State<ChartPage> createState() => _ChartPageState();
}

@override
class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            child: PieChart(PieChartData(
                centerSpaceRadius: 10,
                borderData: FlBorderData(show: false),
                sections: [
              PieChartSectionData(value: 10, color: Colors.purple, radius: 150),
              PieChartSectionData(value: 20, color: Colors.amber, radius: 150),
              PieChartSectionData(
                value: 30,
                color: Colors.green,
                radius: 150,
                title: textData != '' ? textData : 'Firebase verisi çekilemedi',
                showTitle: true,
              )
            ]))));
  }
}
