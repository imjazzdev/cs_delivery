import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/admin_detail_karyawan.dart';
import 'package:cs_delivery/pages/admin_tambah_data_karyawan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../utils/utils.dart';

class DataKaryawanPage extends StatefulWidget {
  @override
  State<DataKaryawanPage> createState() => _DataKaryawanPageState();
}

class _DataKaryawanPageState extends State<DataKaryawanPage> {
  final karyawan = FirebaseFirestore.instance.collection('karyawan');

  //List<String> karyawan = [];
  List<String>? listKaryawan;

  var listResult;

  @override
  Widget build(BuildContext context) {
    final karyawan = FirebaseFirestore.instance.collection('karyawan');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Karyawan',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: karyawan.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
                children: snapshot.data!.docs
                    .map((e) => ListTile(
                        onLongPress: () {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.warning,
                            title: 'Hapus Data?',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              karyawan.doc(e.id).delete();
                            },
                          ).show();
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailKaryawan(
                                        id: e['id'],
                                        nama: e['nama'],
                                        email: e['email'],
                                        telp: e['hp'],
                                        domisili: e['alamat'],
                                      )));
                        },
                        subtitle: Text(
                          'Karyawan ${e['id']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded)))
                    .toList());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: const Text('Loading...'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TambahDataKaryawan()));
          },
          child: Icon(Icons.add)),
    );
  }
}
