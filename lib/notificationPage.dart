import 'package:flutter/material.dart';

void main() {
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
      home: const NotificationPage(title: 'Duygu Anlığı'),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, required this.title});
  final String title;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSelected = false;
  var _filters = [];
  var filterType = '';

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
              height: 15,
            ),
            Card(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  ListTile(
                      title: Text('Şu an nasıl hissediyorsun?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18))),
                  Wrap(spacing: 5.0, runSpacing: 3.0, children: <Widget>[
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFF4696a1),
                      checkmarkColor: Colors.purple,
                      label: const Text('Huzurlu'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFF5d6c90),
                      checkmarkColor: Colors.purple,
                      label: const Text('Üzgün'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFf6b102),
                      checkmarkColor: Colors.purple,
                      label: const Text('Güçlü'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFdd5b58),
                      checkmarkColor: Colors.purple,
                      label: const Text('Öfkeli'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFddf28c40),
                      checkmarkColor: Colors.purple,
                      label: const Text('Sevinçli'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFc48eb6),
                      checkmarkColor: Colors.purple,
                      label: const Text('Kaygılı'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFF4696a1),
                      checkmarkColor: Colors.purple,
                      label: const Text('Tatmin'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFF5d6c90),
                      checkmarkColor: Colors.purple,
                      label: const Text('Sıkılmış'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFf6b102),
                      checkmarkColor: Colors.purple,
                      label: const Text('Değerli'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFdd5b58),
                      checkmarkColor: Colors.purple,
                      label: const Text('Kızgın'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFddf28c40),
                      checkmarkColor: Colors.purple,
                      label: const Text('Mutlu'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFc48eb6),
                      checkmarkColor: Colors.purple,
                      label: const Text('Bunalmış'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFddf28c40),
                      checkmarkColor: Colors.purple,
                      label: const Text('İyimser'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFdd5b58),
                      checkmarkColor: Colors.purple,
                      label: const Text('Rahatsız'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFddf28c40),
                      checkmarkColor: Colors.purple,
                      label: const Text('Heyecanlı'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFF5d6c90),
                      checkmarkColor: Colors.purple,
                      label: const Text('Kayıtsız'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFf6b102),

                      checkmarkColor: Colors.purple,
                      label: const Text('Uyanık'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFF5d6c90),
                      checkmarkColor: Colors.purple,
                      label: const Text('Yalnız'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFdd5b58),
                      checkmarkColor: Colors.purple,
                      label: const Text('İncinmiş'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0XFFddf28c40),

                      checkmarkColor: Colors.purple,
                      label: const Text('Cesur'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                  ]),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                      title: Text('Şu an neredesin?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18))),
                  Wrap(spacing: 5.0, runSpacing: 3.0, children: <Widget>[
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('Ev'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('İş'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('Okul'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('Kurs'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('Spor Salonu'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('Yeme İçme Mekanı'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('Açık Hava'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0Xffd9c8dd),
                      checkmarkColor: Colors.purple,
                      label: const Text('Tatil'),
                      selected: _filters.contains(filterType),
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      //avatar: const Text('F'),
                    ),
                  ]),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            OutlinedButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                primary: Colors.purple,
                backgroundColor: Color.fromARGB(255, 69, 56, 95),
                minimumSize: Size(88, 36),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Tebrikler'),
                    content: Text(
                      'Duygu anlığınız kaydedildi.',
                    ),
                  ),
                );
              },
              child: Text(
                "Save and Exit",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'NotoSerifMakasar',
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
