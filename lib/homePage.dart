import 'package:f79/main.dart';
import 'package:f79/chartPage.dart';
import 'package:f79/notificationPage.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

String userName = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  userName = FirebaseAuth.instance.currentUser!.displayName!;
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F79 Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 157, 114, 230)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'F79', userName: '', userId: ''),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.userId, required this.userName});
  final String title;
  final String userId;
  final String userName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Jiffy.setLocale("tr");
    String _date = '';
    final String date = "${Jiffy.now().EEEE}, ${Jiffy.now().MMMMd}";
    setState(() {
      _date = date;
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
            const SizedBox(
              height: 50,
            ),
            FilledButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                primary: Colors.white,
                minimumSize: const Size(88, 36),
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Text('Hoşgeldin ' + widget.userName),
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton(
              onPressed: () {},
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(
                        title: 'Duygular',
                        userId: widget.userId,
                        userName: widget.userName,
                      ),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/images/questionicon.png',
                  width: 40,
                  color: Colors.white,
                ),
                label: const Text(
                  'Farkında Mısın',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FilledButton(
              onPressed: () {},
              child: TextButton.icon(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChartPage(
                        title: 'Grafikler',
                        userId: widget.userId,
                        userName: widget.userName,
                      ),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/images/graphic.png',
                  width: 40,
                  color: Colors.white,
                ),
                label: const Text(
                  'Grafikler',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            FilledButton(
              onPressed: () {},
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AccountPage(
                        title: 'AccountPage',
                      ),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/images/account.png',
                  width: 40,
                  color: Colors.white,
                ),
                label: const Text(
                  'HESABIM',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
          ],
        ));
  }
}
