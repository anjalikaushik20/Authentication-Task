import 'package:authentication/auth/login/otp.dart';
import 'package:flutter/material.dart';

class PhoneLog extends StatefulWidget {
  const PhoneLog({ Key? key }) : super(key: key);

  @override
  _PhoneLogState createState() => _PhoneLogState();
}

class _PhoneLogState extends State<PhoneLog> {

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
  String _num = '';

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
                        hintText: 'Enter phone number',
                        helperText: 'And country code with +',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if(value!.length != 13) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() => _num = value);
                      },
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OTPLog()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sending OTP...')),
                          );
                        }
                      }, 
                      child: const Text('Get OTP', textAlign: TextAlign.center),
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