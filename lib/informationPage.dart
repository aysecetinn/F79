import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'homePage.dart';

void main() {
  runApp(const Information());
}

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information Page',
      theme: ThemeData(
        fontFamily: 'NotoSerifMakasar',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InformationPage(title: 'Duygu Anlığı'),
    );
  }
}

class InformationPage extends StatefulWidget {
  const InformationPage({super.key, required this.title});
  final String title;

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  void goHomePage() {}

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
          title: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          backgroundColor: Color.fromARGB(255, 69, 56, 95),
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
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.calendar_today,
                            color: Color.fromARGB(255, 138, 116, 185)),
                        title: Text(_date,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'NotoSerifMakasar')))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('assets/images/back.jpg'),
                    ListTile(
                      leading: Icon(
                        Icons.question_answer,
                        color: Color.fromARGB(255, 138, 116, 185),
                      ),
                      title: Text(
                        'F79 uygulaması ne amaçla geliştirildi?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSerifMakasar'),
                      ),
                    ),
                    ListTile(
                      title: Text(
                          'Ruh hali izleme uygulaması bir tür duygu farkındalığı kazandırma egzersizidir.'),
                    ),
                    ListTile(
                      title: Text(
                          'Gün içinde çok kez kısa bildirimlerle dugyuları kaydeder. Gün haftalık ve aylık raporlar halinde sunar.'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.question_answer,
                        color: Color.fromARGB(255, 138, 116, 185),
                      ),
                      title: Text(
                        'F79 uygulaması ne işe yarar?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSerifMakasar'),
                      ),
                    ),
                    ListTile(
                      title: Text('Duygu farkındalığı kazandırır.'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 69, 56, 95),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 69, 56, 95),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(title: "F79")));
                      },
                      child: Text(
                        "Let's Go!",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NotoSerifMakasar',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
