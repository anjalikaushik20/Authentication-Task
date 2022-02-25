import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blueGrey,
    fixedSize: const Size(150, 150),
    textStyle: const TextStyle(fontFamily: 'NotoSans', fontSize: 18),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.mail_outlined),
                      SizedBox(height: 12),
                      Text('Email ID', textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.phone_android_outlined),
                      SizedBox(height: 12),
                      Text('Phone OTP', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.g_translate_outlined),
                      SizedBox(height: 12),
                      Text('Google Account', textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.facebook_outlined),
                      SizedBox(height: 12),
                      Text('Facebook', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

