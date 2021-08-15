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

  final DatabaseReference _dataFirebase = FirebaseDatabase.instance.reference();
  final _listData = <ListTile>[];

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
                    _trial(),
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
    return Center(
      child: StreamBuilder(
        stream: _dataFirebase.child('customer').onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final daftarData = Map<String, dynamic>.from(
                (snapshot.data! as Event).snapshot.value);
            daftarData.forEach((key, value) {
              final nextData = Map<String, dynamic>.from(value);
              final dynamicData = ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text(nextData['nama']),
                subtitle: Text(nextData['alamat']),
              );
              _listData.add(dynamicData);
            });
          }
          return Container(
            child: Column(
              children: _listData,
            ),
          );
        },
      ),
    );
  }

  Widget _trial() {
    return Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: _dataFirebase.child('customer').onValue,
            builder: (context, snapshot) {
              final _listData = <ListTile>[];

              if (snapshot.hasData) {
                final daftarData = Map<String, dynamic>.from(
                    (snapshot.data! as Event).snapshot.value);
                daftarData.forEach((key, value) {
                  final nextData = Map<String, dynamic>.from(value);
                  final dynamicData = ListTile(
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text(nextData['nama']),
                    subtitle: Text(nextData['alamat']),
                  );
                  _listData.add(dynamicData);
                });
              }
              return Container(
                child: Column(
                  children: _listData,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

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

      _dataFirebase
          .child("customer")
          .push()
          .set({'nama': namaUsaha, 'alamat': alamat, 'notlp': noTelepon});
    });
  }

// method end
}
