import 'package:flutter/material.dart';
import 'package:fteam_world/customer/inputCustomer.dart';
import 'package:fteam_world/register.dart';

void main() {
  runApp(HomeTrial());
}

class HomeTrial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: RegPage(),
      home: Inputcustomer(),
    );
  }
}
