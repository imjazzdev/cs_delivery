import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class PetugasPenerimaanDetail extends StatefulWidget {
  final int id;
  final String nama;
  final String telp;
  final String domisili;
  final String email;
  final String luas;
  final String harga;
  final String tanggal_penerimaan;
  const PetugasPenerimaanDetail(
      {required this.id,
      required this.nama,
      required this.telp,
      required this.luas,
      required this.harga,
      required this.domisili,
      required this.tanggal_penerimaan,
      required this.email});

  @override
  State<PetugasPenerimaanDetail> createState() =>
      _PetugasPenerimaanDetailState();
}

class _PetugasPenerimaanDetailState extends State<PetugasPenerimaanDetail> {
  String _valkaryawan = 'Dini';
  TextEditingController catatanC = TextEditingController();
  TextEditingController petugasC = TextEditingController();
  DateTime? _dateTime;

  Future updateorderan() async {
    final docOrder =
        FirebaseFirestore.instance.collection('order').doc('${widget.id}');
    docOrder.update({
      'petugas': Utils.USER_NOW,
      'catatan': catatanC.text,
      'status': 'Selesai'
    });
    docOrder.set({
      'tanggal_selesai': DateFormat('dd-MM-yyyy').format(_dateTime!).toString()
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Flexible(
                child: Text(  
                  'Order ${widget.id}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Telp', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Alamat', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Email', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Luas ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Harga ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tgl Pemesanan",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Petugas",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Tgl Selesai",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ': ${widget.nama}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(': ${widget.telp}', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(': ${widget.domisili}',
                          style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ': ${widget.email}',
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${widget.luas} m2",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${widget.harga}",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${widget.tanggal_penerimaan}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": ${Utils.USER_NOW}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              _dateTime == null
                                  ? ': ${DateFormat('dd-MM-yyyy').format(DateTime.now())}'
                                  : ': ${DateFormat('dd-MM-yyyy').format(_dateTime!)}',
                              style: TextStyle(fontSize: 18)),
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
                              icon: Icon(Icons.calendar_month_rounded)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 220,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextField(
                      controller: catatanC,
                      decoration: InputDecoration(
                          hintText: 'Catatan', border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.warning,
                              title: 'Data tersimpan',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                updateorderan();
                                Navigator.pop(context);
                              },
                            ).show();
                          },
                          child: Text('Simpan'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade800))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
