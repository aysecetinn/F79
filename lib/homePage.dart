import 'package:f79/accountPage.dart';
import 'package:f79/chartPage.dart';
import 'package:f79/notificationPage.dart';
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
        fontFamily: 'NotoSerifMakasar',
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 138, 116, 185)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Duygu Anlığı'),
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
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 219, 255),
              image: DecorationImage(
                  image: AssetImage('assets/images/appicon.jpg'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(
                          Icons.calendar_today,
                          color: Color.fromARGB(255, 143, 124, 185),
                        ),
                        title: Text(_date,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              fontFamily: 'NotoSerifMakasar',
                            )))
                  ],
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 69, 56, 95),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(
                          title: 'Farkında Mısın',
                        ),
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/images/questionicon.png',
                    width: 40,
                    color: Color.fromARGB(255, 69, 56, 95),
                  ),
                  label: const Text(
                    'Farkında Mısın',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 56, 95),
                      fontSize: 25,
                      fontFamily: 'NotoSerifMakasar',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 69, 56, 95),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ChartPage(
                          title: 'Grafikler',
                        ),
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/images/graphic.png',
                    width: 40,
                    color: Color.fromARGB(255, 69, 56, 95),
                  ),
                  label: const Text(
                    'Grafikler',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 56, 95),
                      fontSize: 25,
                      fontFamily: 'NotoSerifMakasar',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 69, 56, 95),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 69, 56, 95),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'NotoSerifMakasar',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
