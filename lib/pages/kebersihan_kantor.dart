import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../utils/utils.dart';
import 'admin_home.dart';

class KebersihanKantor extends StatefulWidget {
  const KebersihanKantor({super.key});

  @override
  State<KebersihanKantor> createState() => _KebersihanKantorState();
}

class _KebersihanKantorState extends State<KebersihanKantor> {
  TextEditingController namaC = TextEditingController();
  TextEditingController telpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController luasC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  TextEditingController tanggalC = TextEditingController();
  DateTime? _dateTime;

  Future createOrder(int harga) async {
    Utils.id_order++;
    final docOrder =
        FirebaseFirestore.instance.collection('order').doc('${Utils.id_order}');
    final user = Transaksi(
        id: Utils.id_order,
        nama: namaC.text,
        hp: telpC.text,
        alamat: alamatC.text,
        email: emailC.text,
        luas: luasC.text,
        harga: NumberFormat.currency(
          locale: 'id',
          symbol: 'Rp ',
        ).format(harga).toString(),
        status: 'Dipesan',
        rumah: false,
        user: FirebaseAuth.instance.currentUser!.email.toString(),
        tanggal_pemesanan:
            DateFormat('dd-MM-yyyy').format(_dateTime!).toString(),
        petugas: '',
        catatan: '',
        feedback: '');

    final json = user.toJson();
    await docOrder.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Kebersihan Kantor',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 65,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_dateTime == null
                        ? 'Pilih Tanggal Pemesanan'
                        : DateFormat('dd-MM-yyyy').format(_dateTime!)),
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2099),
                          ).then((date) {
                            setState(() {
                              _dateTime = date!;
                            });
                          });
                        },
                        icon: Icon(Icons.calendar_month_rounded))
                  ],
                ),
              ),
              TextField(
                  controller: namaC,
                  decoration: InputDecoration(labelText: 'Nama Kantor')),
              TextField(
                  controller: telpC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'No HP')),
              TextField(
                  controller: emailC,
                  decoration: InputDecoration(labelText: 'Email')),
              TextField(
                  controller: alamatC,
                  decoration: InputDecoration(labelText: 'Alamat Kantor')),
              TextField(
                  controller: luasC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Luas Bangunan (m2)')),
              Container(
                  height: 65,
                  decoration: BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(width: 1, color: Colors.grey),
                      // ),
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harga per (m2)',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Rp. 6000',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    var harga = int.parse(luasC.text) * 6000;
                    createOrder(harga);

                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.success,
                      body: const Center(
                        child: Text(
                          'Data Tersimpan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      btnOkOnPress: () {
                        Navigator.pop(context);
                      },
                    ).show();
                  },
                  child: Text(
                    'Simpan',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Transaksi {
  int id;
  final String nama;
  final String hp;
  final String alamat;
  final String email;
  final String luas;
  final String harga;
  final String tanggal_pemesanan;
  final String feedback;
  final String status;
  final String petugas;
  final String catatan;
  final bool rumah;
  final String user;

  Transaksi(
      {required this.id,
      required this.nama,
      required this.hp,
      required this.alamat,
      required this.email,
      required this.luas,
      required this.harga,
      required this.tanggal_pemesanan,
      required this.feedback,
      required this.status,
      required this.rumah,
      required this.petugas,
      required this.catatan,
      required this.user});

  Map<String, dynamic> toJson() => {
        'id_order': id,
        'nama': nama,
        'hp': hp,
        'alamat': alamat,
        'email': email,
        'luas': luas,
        'harga': harga,
        'tanggal_pemesanan': tanggal_pemesanan,
        'status': status,
        'rumah': rumah,
        'user': user,
        'petugas': petugas,
        'catatan': catatan,
        'feedback': feedback
      };
}
