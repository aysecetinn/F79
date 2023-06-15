import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.add_a_photo,
              size: 120,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Welcome to F-79',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Create an account to begin your journey of becoming aware of your emotions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 30,
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
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: verticalpadding, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
