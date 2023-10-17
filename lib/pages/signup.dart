import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/admin_home.dart';
import 'package:cs_delivery/pages/user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isloading = false;
  void startTimer() {
    Timer? _timer;
    int _start = 3;

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const UserHome()),
                (route) => false);
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  TextEditingController namaC = TextEditingController();
  TextEditingController hpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future createUser() async {
    Utils.id_user++;
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailC.text, password: passwordC.text);
    final docUser =
        FirebaseFirestore.instance.collection('users').doc('${Utils.id_user}');
    final user = User(
        id: Utils.id_user,
        nama: namaC.text,
        hp: hpC.text,
        alamat: alamatC.text,
        email: emailC.text);
    final json = user.toJson();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Registrasi',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Flexible(
                      child: TextField(
                          controller: namaC,
                          decoration: InputDecoration(labelText: 'Nama'))),
                  Flexible(
                      child: TextField(
                          controller: hpC,
                          decoration: InputDecoration(labelText: 'No HP'))),
                  Flexible(
                      child: TextField(
                          controller: alamatC,
                          decoration: InputDecoration(labelText: 'Alamat'))),
                  Flexible(
                      child: TextField(
                          controller: emailC,
                          decoration: InputDecoration(labelText: 'Email'))),
                  Flexible(
                      child: TextField(
                          controller: passwordC,
                          decoration: InputDecoration(labelText: 'Password'))),
                  SizedBox(
                    height: 25,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isloading = !_isloading;
                          });
                          createUser();
                          startTimer();
                        },
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class User {
  int id;
  final String nama;
  final String hp;
  final String alamat;
  final String email;
  User({
    required this.id,
    required this.nama,
    required this.hp,
    required this.alamat,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'hp': hp,
        'alamat': alamat,
        'email': email,
      };
}
