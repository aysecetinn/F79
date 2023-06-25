import 'package:f79/accountPage.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

void main() {
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
      home: const HomePage(title: 'F79 Ana Sayfa'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

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
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(
                        title: 'Farkında Mısın',
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        title: 'HomePage',
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
