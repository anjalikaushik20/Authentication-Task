import 'package:authentication/dashboard.dart';
import 'package:flutter/material.dart';

class OTPLog extends StatefulWidget {
  const OTPLog({ Key? key }) : super(key: key);

  @override
  _OTPLogState createState() => _OTPLogState();
}

class _OTPLogState extends State<OTPLog> {

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
  String _otp = '';

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
            const Icon(Icons.message_rounded),
            const SizedBox(height: 12),
            RichText(
              text: const TextSpan(
                text: 'Login with OTP',
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 350,
              width: 250,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter OTP',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Please enter OTP';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() => _otp = value);
                      },
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Dashboard()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Logging in...')),
                          );
                        }
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