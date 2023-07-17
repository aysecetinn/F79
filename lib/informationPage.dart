import 'package:f79/notificationPage.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'main.dart';

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
      home: const InformationPage(title: 'Duygu Haritası'),
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
        body: SafeArea(
            child: Container(
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
                  child: Column(children: <Widget>[
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
                                  'Duygu Haritası uygulaması ne amaçla geliştirildi?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSerifMakasar'),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                    'Duygu Anlığı uygulaması bir tür duygu farkındalığı kazandırma egzersizidir. Gün içinde çok kez kısa bildirimlerle duyguları kaydeder. Günlük, haftalık ve aylık raporlar halinde sunar. Duygusal farkındalık, duyguları öğrenmeyi gerektirdiğinden duyguları adlandırmak duygusal farkındalık geliştirmek için bir ilk adımdır. Duygu Anlığı 6 temel duygu ve etrafındaki ilişkili birçok duyguyu geniş ölçekte isimlendirerek size o an nasıl hissettiğinizi sorar, seçenekler verir ve duygularınızı adlandırmanızı ister. Burada amaç ‘şu anda’ zihninizi kontrol eden her duygunun tam farkındalığıdır. Gün içinde sorulan duygu durumu sorularına verilen yanıtları, “Nasıldın?” ve “Ne yapıyordun?” başlıklarıyla kullanıcının ne ile, ne zaman, nasıl hissettiğinin kaydını grafikler halinde sunar. Böylece sıklıkla tekrar eden baskın duyguların fark edilmesine de olanak sağlar.  '),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.question_answer,
                                  color: Color.fromARGB(255, 138, 116, 185),
                                ),
                                title: Text(
                                  'Duygu Haritası uygulaması ne işe yarar?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSerifMakasar'),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                    'Duyguları fark etmek ise bireyin kendi düşünce örgüsünü analiz etmesine, bu duyguların altında yatan düşüncelerle karşılaşmasına yardımcı olur. Ne hissettiğimizi fark etmek ve onu adlandırmak, Duygu Anlığı ile duygusal farkındalığa doğru büyük bir adımdır.'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 69, 56, 95),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 16),
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
                                      builder: (context) => NotificationPage(
                                          title: "Duygu Haritası",
                                          userName: '',
                                          userId: '')));
                                },
                                child: const Text(
                                  "Hadi Başlayalım!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NotoSerifMakasar',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(10.0))
                            ]))
                  ]),
                ))));
  }
}
