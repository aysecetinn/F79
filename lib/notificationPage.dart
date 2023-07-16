import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f79/chartPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:localstore/localstore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Notification());
}

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F79',
      theme: ThemeData(
        fontFamily: 'NotoSerifMakasar',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const NotificationPage(title: 'F79', userId: '', userName: ''),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, required this.title, required this.userId, required this.userName});
  final String title;
  final String userId;
  final String userName;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

Future<Map<String, dynamic>?> getUserValue() async {
  final db = Localstore.instance;
  var userData = await db.collection('user').doc("myUser").get();

  return userData;
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSelected = false;
  var filterType = '';
  var _emotions = [];
  var _locations = [];


  saveEmotionsWithFirebase (context, data) {
    print('user: ' + data["userId"]);
    var now = DateTime.now();
    var date = now.year.toString() + "-" + now.month.toString() + "-" + now.day.toString();
    var db = FirebaseFirestore.instance;
    db.collection('emotion/${data["userId"]}/$date').add({
      "emotions": _emotions,
      "locations": _locations,
      "createdTime": now.hour.toString() + ":" + now.minute.toString()
    }).catchError((err) => print(err));

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChartPage(
          title: 'Grafik Sayfan',
          userId: data["userId"],
          userName: data["userName"],
        ),
      ),
    );
  }

  FilterChip CreateFilterChip(String emotion, String colorCode) {
    return FilterChip(
      selected: _emotions.contains(emotion+","+colorCode),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Color(int.parse(colorCode)),
      checkmarkColor: Colors.purple,
      label: Text(emotion),
      onSelected: (bool selected) {
        setState(() {
          if (_emotions.length < 3  && !_emotions.contains(emotion+","+colorCode)){
            _emotions.add(emotion+","+colorCode);
          } else {
            _emotions.remove(emotion+","+colorCode);
          }
        });
      },
      //avatar: const Text('F'),
    );
  }

  FilterChip CreateFilterChipForLocation(String emotion, String colorCode) {
    return FilterChip(
      selected: _locations.contains(emotion+","+colorCode),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Color(int.parse(colorCode)),
      checkmarkColor: Colors.purple,
      label: Text(emotion),
      onSelected: (bool selected) {
        setState(() {
          if (!_locations.contains(emotion+","+colorCode)){
            _locations.clear();
            _locations.add(emotion+","+colorCode);
          } else {
            _locations.remove(emotion+","+colorCode);
          }
        });
      },
      //avatar: const Text('F'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 69, 56, 95),
        title: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                const ListTile(
                    title: Text('Şu an nasıl hissediyorsun?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                Wrap(spacing: 5.0, runSpacing: 3.0, children: <Widget>[
                  CreateFilterChip('Huzurlu', '0XFF4696a1'),
                  CreateFilterChip('Üzgün', '0XFF5d6c90'),
                  CreateFilterChip('Güçlü', '0XFFf6b102'),
                  CreateFilterChip('Öfkeli', '0XFFdd5b58'),
                  CreateFilterChip('Sevinçli', '0XFFddf28c40'),
                  CreateFilterChip('Kaygılı', '0XFFc48eb6'),
                  CreateFilterChip('Tatmin', '0XFF4696a1'),
                  CreateFilterChip('Sıkılmış', '0XFF5d6c90'),
                  CreateFilterChip('Değerli', '0XFFf6b102'),
                  CreateFilterChip('Kızgın', '0XFFdd5b58'),
                  CreateFilterChip('Mutlu', '0XFFddf28c40'),
                  CreateFilterChip('Bunalmış', '0XFFc48eb6'),
                  CreateFilterChip('İyimser', '0XFFddf28c40'),
                  CreateFilterChip('Rahatsız', '0XFFdd5b58'),
                  CreateFilterChip('Heyecanlı', '0XFFddf28c40'),
                  CreateFilterChip('Kayıtsız', '0XFF5d6c90'),
                  CreateFilterChip('Uyanık', '0XFFf6b102'),
                  CreateFilterChip('Yalnız', '0XFF5d6c90'),
                  CreateFilterChip('İncinmiş', '0XFFdd5b58'),
                  CreateFilterChip('Cesur', '0XFFddf28c40'),
                ]),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                const ListTile(
                    title: Text('Şu an neredesin?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                Wrap(spacing: 5.0, runSpacing: 3.0, children: <Widget>[
                  CreateFilterChipForLocation('Ev', '0Xffd9c8dd'),
                  CreateFilterChipForLocation('İş', '0Xffd9c8dd'),
                  CreateFilterChipForLocation('Okul', '0Xffd9c8dd'),
                  CreateFilterChipForLocation('Kurs', '0Xffd9c8dd'),
                  CreateFilterChipForLocation('Spor Salonu', '0Xffd9c8dd'),
                  CreateFilterChipForLocation('Yeme İçme Mekanı', '0Xffd9c8dd'),
                  CreateFilterChipForLocation('Açık Hava', '0Xffd9c8dd'),
                  CreateFilterChipForLocation('Tatil', '0Xffd9c8dd'),
                ]),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          FutureBuilder<Map<String, dynamic>?>(
            future: getUserValue(),
            builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
              if (snapshot.hasData) {
                return OutlinedButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    primary: Colors.purple,
                    minimumSize: Size(88, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    saveEmotionsWithFirebase(context, snapshot.data);
                  },
                  child: const Text("Kaydet"),
                );
              } else { return Text("Kayıt Butonu Yükleniyor"); }
            }
          ),
        ],
      )),
    );
  }
}
