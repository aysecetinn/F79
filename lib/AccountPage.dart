import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localstore/localstore.dart';
import 'package:workmanager/workmanager.dart';

import 'loginPage.dart';

Map<String, dynamic>? userData;
bool notificationPermission = false;
Future<void> main() async {
  runApp(const Account());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    FlutterLocalNotificationsPlugin flip = FlutterLocalNotificationsPlugin();
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var IOS = const DarwinInitializationSettings();
    var settings = InitializationSettings(android: android, iOS: IOS);
    flip.initialize(settings);
    _showNotificationWithDefaultSound(flip);
    return Future.value(true);
  });
}

Future _showNotificationWithDefaultSound(flip) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'emotionf79id',
      'emotionf70channel',
      importance: Importance.max,
      priority: Priority.high
  );
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics
  );
  await flip.show(0, 'Duygularını Keşfet',
      'Hadi ne hissettiğini görelim!',
      platformChannelSpecifics, payload: 'Default_Sound'
  );
}

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F79 Account',
      theme: ThemeData(
        fontFamily: 'NotoSerifMakasar',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 157, 114, 230)),
        useMaterial3: true,
      ),
      home: const AccountPage(title: 'Hesabım'),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.title});
  final String title;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

Future<Map<String, dynamic>?> getUserValue() async {
  final db = Localstore.instance;
  var userData = await db.collection('user').doc("myUser").get();

  return userData;
}

class _AccountPageState extends State<AccountPage> {
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  bool _isSecure = true;
  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Localstore.instance;
    var response = db.collection('user').doc("myUser").get();
    var data;
    response.then((value) => data = value);
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final screenSize = MediaQuery.of(context).size;


    setState(() {
      userData = data;
    });


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
      body: SingleChildScrollView(child: FutureBuilder<Map<String, dynamic>?>(
        future: getUserValue(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 219, 255),
                image: DecorationImage(
                    image: AssetImage('assets/images/appicon.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 70.0,
                        minRadius: 70.0,
                        backgroundColor: Color.fromARGB(255, 167, 143, 213),
                        backgroundImage: NetworkImage(snapshot.data?["photo"]),
                      ),
                      SizedBox(
                        width: 70,
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data?["userName"] ?? "Ad Soyad",
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'NotoSerifMakasar',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Card(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            title: Center(
                              child: Text('Bildirim Seçeneklerim',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    fontFamily: 'NotoSerifMakasar',
                                  )),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            primary: Colors.black54,
                            minimumSize: Size(88, 36),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Text(!notificationPermission ? "Bildirime İzin Ver" : "Bildirime İzin Verildi"),
                          onPressed: () {
                            setState(() {
                              notificationPermission = !notificationPermission;
                            });
                            WidgetsFlutterBinding.ensureInitialized();
                            Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
                            Workmanager().registerPeriodicTask("emotionPeriotTask1","emotionPeriotHourTask2", frequency: const Duration(minutes: 1));
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Card(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            title: Center(
                              child: Text('Uygulama Kilidi Şifresi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    fontFamily: 'NotoSerifMakasar',
                                  )),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 60,
                    child: TextField(
                      obscureText: _isSecure,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Color.fromARGB(255, 122, 92, 185),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 122, 92, 185),
                            fontFamily: 'NotoSerifMakasar',
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _changeLoading();
                              },
                              icon: Icon(_isSecure
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  OutlinedButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        primary: Colors.black54,
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: Text("Çıkış Yap"),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        final db = Localstore.instance;
                        await db.collection('user').doc("myUser").delete();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      }),
                  const Icon(
                    Icons.local_post_office_outlined,
                    size: 100,
                  ),
                  const Text(
                    'Bize Ulaşın',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NotoSerifMakasar',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        } else { return Text('kullanıcı Verisi Getiriliyor'); }
        }))
    );
  }
}
