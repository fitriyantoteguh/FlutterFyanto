import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class Inputcustomer extends StatefulWidget {
  const Inputcustomer({Key? key}) : super(key: key);

  @override
  _InputcustomerState createState() => _InputcustomerState();
}

class _InputcustomerState extends State<Inputcustomer> {
  TextEditingController _namaUsaha = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _noTelp = TextEditingController();

  List<String> dataList = [];
  String namaUsaha = "", noTelepon = "", alamat = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Input Data"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildFormNama(),
                    _buildAlamat(),
                    _buildnoTelpon(),
                    _buildButton(),
                    _buildTextview(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  //  form start

  Widget _buildFormNama() {
    return TextFormField(
      controller: _namaUsaha,
      decoration: InputDecoration(
        labelText: "Nama Usaha",
      ),
    );
  }

  Widget _buildAlamat() {
    return TextFormField(
      controller: _alamat,
      decoration: InputDecoration(
        labelText: "Alamat",
      ),
    );
  }

  Widget _buildnoTelpon() {
    return TextFormField(
      controller: _noTelp,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "NoTelepon ",
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {
        antok();
      },
      child: Text("Submit"),
    );
  }

  Widget _buildTextview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [Text('$namaUsaha'), Text('$alamat'), Text('$noTelepon')],
    );
  }

  // Widget _buildListView() {
  //   return
  // }

// form end

// method start
  void antok() {
    setState(() {
      namaUsaha = _namaUsaha.text.toString();
      alamat = _alamat.text.toString();
      noTelepon = _noTelp.text.toString();
      _namaUsaha.clear();
      _alamat.clear();
      _noTelp.clear();
    });
  }
// method end
}
