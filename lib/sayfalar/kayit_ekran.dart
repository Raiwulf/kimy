import 'package:flutter/material.dart';
import 'package:kimy/components/rounded_button.dart';
import 'package:kimy/constants.dart';
import 'chat_ekran.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KayitEkran extends StatefulWidget {
  static const String id = 'kayit_ekran';
  @override
  _KayitEkranState createState() => _KayitEkranState();
}

class _KayitEkranState extends State<KayitEkran> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'Email adresinizi giriniz'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Şifrenizi giriniz'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Kayıt Ol',
                colour: Colors.red,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                        
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatEkran.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    _showDialog("Hata", e.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}