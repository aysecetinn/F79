import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSerifMakasar',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 55,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Welcome to Duygu Anlığı',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'NotoSerifMakasar'),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Create an account to begin your journey of becoming aware of your emotions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSerifMakasar'),
              ),
              SizedBox(
                height: 40,
              ),
              SocialButton(
                  iconPath: 'assets/images/google2.png',
                  label: 'Continue with Google'),
              SizedBox(
                height: 20,
              ),
              SocialButton(
                iconPath: 'assets/images/facebook2.png',
                label: 'Continue with Facebook',
                horizontalPadding: 60,
                verticalpadding: 13,
              ),
              SizedBox(
                height: 20,
              ),
              SocialButton(
                iconPath: 'assets/images/apple2.png',
                label: 'Continue with Apple',
                horizontalPadding: 73,
                verticalpadding: 9,
              ),
              SizedBox(
                height: 20,
              ),
              SocialButton(
                iconPath: 'assets/images/mail2.png',
                label: 'Continue with Email',
                horizontalPadding: 75,
                verticalpadding: 15,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  final double verticalpadding;
  const SocialButton(
      {Key? key,
      required this.iconPath,
      required this.label,
      this.horizontalPadding = 70,
      this.verticalpadding = 13})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Image.asset(
        iconPath,
        width: 30,
      ),
      label: Text(
        label,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'NotoSerifMakasar',
            fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: verticalpadding, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color.fromARGB(255, 69, 56, 95),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
