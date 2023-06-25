import 'package:flutter/material.dart';

void main() {
  runApp(const Account());
}

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F79 Account',
      theme: ThemeData(
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
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hesabım'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 70.0,
                  minRadius: 70.0,
                  backgroundColor: Color.fromARGB(255, 141, 100, 212),
                  backgroundImage: AssetImage('assets/images/account.png'),
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
                      'Ad Soyad',
                      style: TextStyle(fontSize: 30),
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
                            fontWeight: FontWeight.bold, fontSize: 29)),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$hours:$minutes', style: TextStyle(fontSize: 50)),
                ElevatedButton(
                    child: const Icon(
                      Icons.add_box_outlined,
                      size: 50,
                    ),
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: time,
                      );
                      if (newTime == null) return;
                      setState(() => time = newTime);
                    })
              ],
            ),
            const SizedBox(
              height: 30,
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
                            fontWeight: FontWeight.bold, fontSize: 29)),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: TextField(
                obscureText: _isSecure,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.deepPurple),
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
              height: 50,
            ),
            const Icon(
              Icons.local_post_office_outlined,
              size: 100,
            ),
            const Text(
              'Bize Ulaşın',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
