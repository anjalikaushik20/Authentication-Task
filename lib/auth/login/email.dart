import 'package:authentication/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailLog extends StatefulWidget {
  const EmailLog({ Key? key }) : super(key: key);

  @override
  _EmailLogState createState() => _EmailLogState();
}

class _EmailLogState extends State<EmailLog> {

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blueGrey,
    fixedSize: const Size(100, 100),
    textStyle: const TextStyle(fontFamily: 'NotoSans', fontSize: 18),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final _formKey = GlobalKey<FormState>();
  String mail = "", pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.mail_rounded),
            const SizedBox(height: 12),
            RichText(
              text: const TextSpan(
                text: 'Login with Email ID',
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 12),
             SizedBox(
              width: 250,
              height: 300,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter email',
                      ),
                      validator: (value) {
                        if(!EmailValidator.validate(value!)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() => mail = value);
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter password'
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() => pass = value);
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data...')),
                          );
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Dashboard()),
                        );
                      },
                      child: const Text('Login', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}