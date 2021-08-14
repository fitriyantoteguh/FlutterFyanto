import 'package:flutter/material.dart';
import 'package:fteam_world/tambahuser.dart';

class RegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jancok"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AppUser();
            }));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
