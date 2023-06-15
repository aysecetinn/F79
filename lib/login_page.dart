import 'package:flutter/material.dart';
import 'package:loginexample/button.dart';

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