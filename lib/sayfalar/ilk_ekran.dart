import 'package:flutter/material.dart';
import 'giris_ekran.dart';
import 'kayit_ekran.dart';
import 'package:kimy/components/rounded_button.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ilkEkran extends StatefulWidget {
  static const String id = 'ilk_ekran';

  @override
  _ilkEkranState createState () => _ilkEkranState();
}

class _ilkEkranState extends State<ilkEkran>
  with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AvatarGlow(
                    startDelay: Duration(milliseconds: 1000),
                    glowColor: Colors.redAccent,
                    endRadius: 120.0,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor:Colors.white30 ,
                        child: Image.asset('assets/logo.png',height: 100),
                        radius: 80.0,
                      ),
                    ),
                    shape: BoxShape.circle,
                    animate: true,
                    curve: Curves.fastOutSlowIn,
                  ),

                ]),
            SizedBox(
              height: 32.0,
            ),
            RoundedButton(
              title: 'Giriş',
              colour: Colors.redAccent,
              onPressed: () {
                Navigator.pushNamed(context, GirisEkran.id);
              },
            ),
            RoundedButton(
              title: 'Kayıt Ol',
              colour: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, KayitEkran.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}