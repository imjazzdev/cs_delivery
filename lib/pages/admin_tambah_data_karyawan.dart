import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/admin_data_karyawan.dart';
import 'package:cs_delivery/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TambahDataKaryawan extends StatefulWidget {
  const TambahDataKaryawan({super.key});

  @override
  State<TambahDataKaryawan> createState() => _TambahDataKaryawanState();
}

class _TambahDataKaryawanState extends State<TambahDataKaryawan> {
  TextEditingController nama = TextEditingController();
  TextEditingController hp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController email = TextEditingController();

  Future createKaryawan() async {
    Utils.id_karyawan++;
    final docKaryawan = FirebaseFirestore.instance
        .collection('karyawan')
        .doc('${Utils.id_karyawan}');
    final karyawan = Karyawan(
        id: Utils.id_karyawan,
        nama: nama.text,
        hp: hp.text,
        alamat: alamat.text,
        email: email.text);

    final json = karyawan.toJson();
    await docKaryawan.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.only(left: 25, right: 25),
        children: [
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  'Tambah Data Karyawan',
                  style: TextStyle(fontSize: 25),
                ),
              )),
          TextField(
            controller: nama,
            decoration: InputDecoration(
                labelText: 'Nama', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: hp,
            decoration: InputDecoration(
                labelText: 'No Telp', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: alamat,
            decoration: InputDecoration(
                labelText: 'Alamat', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                labelText: 'Email', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800),
                onPressed: () {
                  createKaryawan();
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    body: Center(
                      child: Text(
                        'Data Tersimpan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    btnOkOnPress: () {
                      Navigator.pop(context);
                    },
                  )..show();
                },
                child: const Text('Simpan')),
          )
        ],
      )),
    );
  }
}

class Karyawan {
  int id;
  final String nama;
  final String hp;
  final String alamat;
  final String email;
  Karyawan({
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
