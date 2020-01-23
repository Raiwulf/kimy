import 'package:flutter/material.dart';
import 'package:kimy/sayfalar/giris_ekran.dart';
import 'package:kimy/sayfalar/ilk_ekran.dart';
import 'package:kimy/sayfalar/kayit_ekran.dart';
import 'package:kimy/sayfalar/chat_ekran.dart';
import 'package:kimy/sayfalar/pm_ekran.dart';

void main() => runApp(kimy());

class kimy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ilkEkran.id,
      routes: {
        ilkEkran.id: (context) => ilkEkran(),
        GirisEkran.id: (context) => GirisEkran(),
        KayitEkran.id: (context) => KayitEkran(),
        ChatEkran.id: (context) => ChatEkran(),
        PmEkran.id: (context) => PmEkran(),
      },
    );
  }
}
