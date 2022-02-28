import 'package:authentication/auth/login/email.dart';
import 'package:authentication/auth/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailReg extends StatefulWidget {
  const EmailReg({ Key? key }) : super(key: key);

  @override
  _EmailRegState createState() => _EmailRegState();
}

class _EmailRegState extends State<EmailReg> {

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
  String _mail = "", _pass = "", _name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up', textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.mail_rounded),
            const SizedBox(height: 12),
            RichText(
              text: const TextSpan(
                text: 'Register using Email ID',
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
                        hintText: 'Enter Fullname',
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter name';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() => _name = value);
                      },
                    ),
                    const SizedBox(height: 10),
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
                        setState(() => _mail = value);
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
                        setState(() => _pass = value);
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          FireServices().signUp(email: _mail, password: _pass).then((value)
                          {
                            if(value == null){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const EmailLog()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data...')),
                              );
                            }
                          });
                        }
                      },
                      child: const Text('Register', textAlign: TextAlign.center),
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