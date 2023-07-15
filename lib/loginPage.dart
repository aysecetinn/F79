import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
                label: 'Continue with Google',
                type: 'Google',
            ),
            SizedBox(
              height: 20,
            ),
            SocialButton(
              iconPath: 'assets/images/facebook2.png',
              label: 'Continue with Facebook',
              horizontalPadding: 60,
              verticalpadding: 13,
              type: 'Facebook',
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

Future<void> loginWithProvider(type, context) async {
   if (type == 'Facebook') {
     final LoginResult loginResult = await FacebookAuth.instance.login();
     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final res = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
     Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => HomePage(title: "F79", userId: res.user!.uid!, userName: res.user!.displayName!)));
  } else {
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );

     final res = await FirebaseAuth.instance.signInWithCredential(credential);
     Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => HomePage(title: "F79", userId: res.user!.uid!, userName: res.user!.displayName!)));
   }
}

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final String type;
  final double horizontalPadding;
  final double verticalpadding;
  const SocialButton(
      {Key? key,
      required this.iconPath,
      required this.label,
      required this.type,
      this.horizontalPadding = 70,
      this.verticalpadding = 13})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async { await loginWithProvider(type, context); },
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
