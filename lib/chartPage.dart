import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:localstore/localstore.dart';

String textData = '';
String createdDate = '';
List emotionData = [];
List locationData = [];
List<EmotionClass> _result = [];
List<LocationClass> _locations = [];
List<Widget> _progressList = [];
bool isToday = true;
Map<String, dynamic>? userData;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Chart());
}

class EmotionClass {
  String emotionName = "";
  String colorCode = "";
  int count = 0;
  String location = "";
  Map<String, dynamic>? userData;
}

class LocationClass {
  String locationName = "";
  String colorCode = "";
  int count = 0;
}

// buradaki metod örnek olarak firebaseden veriyi çekmek için yazıldı.
// bu metod firebase'den veriyi çekip en yukarıdaki textData değişkenine atıyor.
// daha sonra ilgili değişkeni widget içerisinde kullanarak veriyor gösteriyoruz.
Future<String> getData(bool isToday) async {
  final localDb = Localstore.instance;
  userData = await localDb.collection('user').doc("myUser").get();

  _result = [];
  var now = DateTime.now();
  var date = now.year.toString() + "-" + now.month.toString() + "-" + (isToday ? now.day.toString() : (now.day - 1).toString());
  var db = FirebaseFirestore.instance;
  var reference = db.collection('emotion/${userData?["userId"]}/$date');
  var response = await reference.get();

  if (!isToday) {
    int day = DateTime.now().day;
    date = date.replaceAll(day.toString(), (day - 1).toString());
  }
  locationData = [];

  //gün içerisinde eklenen duygular forEach ile döngüye sokuluyor
  response.docs.forEach((userDatas) {
    var datas = userDatas.data();
    var emotions = datas['emotions'];
    var location = datas['locations'];
    locationData.add(location);
    for(var emotion in emotions) {
      if (_result.any((element) => element.emotionName == emotion.split(',')[0])) {
        var value = _result.where((element) => element.emotionName == emotion.split(',')[0]).first;
        _result.remove(value);
        value.count += 1;
        _result.add(value);
      } else {
        EmotionClass emotionClass = EmotionClass();
        emotionClass.emotionName = emotion.split(',')[0];
        emotionClass.colorCode = emotion.split(',')[1];
        emotionClass.count = 1;
        _result.add(emotionClass);
      }
    }
  });
  ProgressBarList(locationData);

  return "";
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
      home: const ChartPage(title: 'F79', userId: '', userName: ''),
    );
  }
}

PieChartSectionData CreatePie(int i) {
  final isTouched = i == -1;
  final fontSize = isTouched ? 25.0 : 16.0;
  final radius = isTouched ? 60.0 : 50.0;
  const shadows = [Shadow(color: Colors.black, blurRadius: 1)];
  return PieChartSectionData(
    color: Color(int.parse(_result[i].colorCode)),
    value: _result[i].count * 10,
    title: _result[i].emotionName,
    radius: radius,
    titleStyle: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: shadows,
    ),
  );
}

List<PieChartSectionData> showingSections(List<EmotionClass> _result) {
  if (_result.isEmpty) {
    final isTouched = false;
    final fontSize = isTouched ? 25.0 : 16.0;
    final radius = isTouched ? 60.0 : 50.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 1)];
    return List.generate(1, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0XFF5d6c90),
            value: 100,
            title: "",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  } else {
    return List.generate(_result.length, (i) {
      for (var emotion in _result) {
        return CreatePie(i);
      }

      return CreatePie(i);
    });
  }
}

List<LocationClass> ProgressBarList(List<dynamic> locations) {
  _locations = [];

  for (var locationVal in locations) {
    if (_locations.any((element) => element.locationName == locationVal[0].split(',')[0])){
      continue;
    }
    LocationClass locationClass = LocationClass();
    locationClass.locationName = locationVal[0].split(',')[0];
    locationClass.colorCode = locationVal[0].split(',')[1];
    locationClass.count = locations.where((element) => element[0].split(',')[0] == locationVal[0].split(',')[0]).length;

    _locations.add(locationClass);
  }

    return _locations;
}

class ChartPage extends StatefulWidget {
  const ChartPage({super.key, required this.title, required this.userId, required this.userName});
  final String title;
  final String userId;
  final String userName;

  @override
  State<ChartPage> createState() => _ChartPageState();
}

@override
class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    Jiffy.setLocale("tr");
    String _date = '';
    String date = "${Jiffy.now().EEEE}, ${Jiffy.now().MMMMd}";
    if (!isToday) {
      int day = DateTime.now().day;
      date = date.replaceAll(day.toString(), (day - 1).toString());
    }
    setState(() {
      _date = date;
    });

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FilledButton(
                          onPressed: () { setState(() {
                            isToday = false;
                          }); },
                          style: TextButton.styleFrom(
                            textStyle:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            primary: Colors.white,
                            minimumSize: Size((MediaQuery.of(context).size.width - 10) / 2, 36),
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Text('Önceki Gün'),
                        ),
                        FilledButton(
                          onPressed: () { setState(() {
                            isToday = true;
                          }); },
                          style: TextButton.styleFrom(
                            textStyle:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            primary: Colors.white,
                            minimumSize: Size((MediaQuery.of(context).size.width - 10) / 2, 36),
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Text('Bugün'),
                        ),
                      ]
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(
                          Icons.calendar_today,
                          color: Colors.deepPurple,
                        ),
                        title: Text(_date,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19)))
                  ],
                ),
              ),
              FutureBuilder<String>(
              future: getData(isToday),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                    return Container(
                        child: Column(
                            children: <Widget> [
                              AspectRatio(
                                aspectRatio: 1,
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                    },
                                    ),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0.5,
                                    centerSpaceRadius: 100,
                                    sections: showingSections(_result),
                                  ),
                                ),
                              ),
                              Card(
                                child: Column(
                                  children: [
                                      const ListTile(
                                          leading: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.deepPurple,
                                          ),
                                          title: Text('Konumlar',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 19))),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: _locations.map((location) {
                                          return Column(
                                              children: <Widget> [
                                                LinearProgressIndicator(
                                                  backgroundColor: Color(int.parse(location.colorCode)),
                                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                                                  value: (location.count * 0.3),
                                                ),
                                                Text(location.locationName),]
                                          );
                                        }).toList()
                                    )
                                  ]
                                ),
                              ),
                            ]
                        )
                    );
                } else {
                  return Text(userData?["userName"] + ' kullanıcısının verileri getiriliyor.');
                }
              },
            ),
            ])));
  }
}
