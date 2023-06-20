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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InformationPage(title: 'F79'),
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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        color: Colors.deepPurple,
                      ),
                      title: Text(_date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)))
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
                  Image.network(
                    'https://img.freepik.com/premium-vector/abstract-background-purple-colors_444390-5780.jpg',
                    fit: BoxFit.fill,
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.question_answer, color: Colors.deepPurple),
                    title: Text(
                      'F79 uygulaması ne amaçla geliştirildi?',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                    leading:
                        Icon(Icons.question_answer, color: Colors.deepPurple),
                    title: Text(
                      'F79 uygulaması ne işe yarar?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text('Duygu farkındalığı kazandırır.'),
                  ),
                  FilledButton(
                    style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      primary: Colors.white,
                      minimumSize: Size(88, 36),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(title: "F79")));
                    },
                    child: Text("Let's Go!"),
                  ),
                  Padding(padding: EdgeInsets.all(10.0))
                ],
              ),
            )
          ],
        ));
  }
}
