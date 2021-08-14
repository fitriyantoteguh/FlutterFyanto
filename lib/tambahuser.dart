import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class AppUser extends StatefulWidget {
  const AppUser({Key? key}) : super(key: key);

  @override
  _AppUserState createState() => _AppUserState();
}

class _AppUserState extends State<AppUser> {
  int angka = 0;
  final DatabaseReference dataFirebase = FirebaseDatabase.instance.reference();

  void kanan() {
    setState(() {
      angka++;
    });
    // DatabaseReference _antok =
    //     FirebaseDatabase.instance.reference().child("antok");
    // _antok.set("joko $angka");
    dataFirebase.child("antok").set("joko");
  }

  void kiri() {
    setState(() {
      angka--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("$angka"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: kiri, child: Icon(Icons.arrow_back)),
            Text('$angka'),
            ElevatedButton(onPressed: kanan, child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
