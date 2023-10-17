import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class UserOrderanSelesaiDetail extends StatefulWidget {
  final int id;
  final String nama;
  final String telp;
  final String domisili;
  final String email;
  final String luas;
  final String harga;
  final String tanggal_pemesanan;
  final String tanggal_selesai;
  final String petugas;
  final String catatan;
  final String feedback;

  const UserOrderanSelesaiDetail(
      {super.key,
      required this.id,
      required this.nama,
      required this.telp,
      required this.domisili,
      required this.email,
      required this.luas,
      required this.harga,
      required this.tanggal_pemesanan,
      required this.tanggal_selesai,
      required this.petugas,
      required this.catatan,
      required this.feedback});

  @override
  State<UserOrderanSelesaiDetail> createState() =>
      _UserOrderanSelesaiDetailState();
}

class _UserOrderanSelesaiDetailState extends State<UserOrderanSelesaiDetail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackC = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Order ${widget.id}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(children: [
                      Text(
                        'Nama',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ': ${widget.nama}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Telp',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(': ${widget.telp}', style: TextStyle(fontSize: 18))
                    ]),
                    TableRow(children: [
                      Text(
                        'Alamat',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(': ${widget.domisili}',
                              style: TextStyle(fontSize: 18))),
                    ]),
                    TableRow(children: [
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ': ${widget.email}',
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Luas',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": ${widget.luas} m2",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Harga',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": ${widget.harga}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Tgl Pemesanan',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": ${widget.tanggal_pemesanan}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Tgl Selesai',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": ${widget.tanggal_selesai}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Petugas',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": ${widget.petugas}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Catatan',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": ${widget.catatan}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    // TableRow(children: [
                    //   Text(
                    //     'Feedback',
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    //   widget.feedback == ''
                    //       ? Stack(
                    //           children: [
                    //             Container(
                    //               height: 100,
                    //               width: 220,
                    //               padding: EdgeInsets.only(left: 5, right: 5),
                    //               decoration:
                    //                   BoxDecoration(border: Border.all()),
                    //               child: TextField(
                    //                 controller: feedbackC,
                    //                 maxLines: 4,
                    //                 decoration: InputDecoration(
                    //                     hintText: 'Berikan feedback',
                    //                     border: InputBorder.none),
                    //               ),
                    //             ),
                    //             Positioned(
                    //                 bottom: 2,
                    //                 right: 2,
                    //                 child: CircleAvatar(
                    //                   radius: 18,
                    //                   backgroundColor: Colors.white,
                    //                   child: IconButton(
                    //                       onPressed: () {
                    //                         AwesomeDialog(
                    //                           context: context,
                    //                           animType: AnimType.scale,
                    //                           dialogType: DialogType.success,
                    //                           body: Center(
                    //                             child: Text(
                    //                               'Kirim feedback',
                    //                               style: TextStyle(
                    //                                   fontWeight:
                    //                                       FontWeight.bold,
                    //                                   fontSize: 18),
                    //                             ),
                    //                           ),
                    //                           btnOkOnPress: () {
                    //                             final docOrder =
                    //                                 FirebaseFirestore.instance
                    //                                     .collection('order')
                    //                                     .doc('${widget.id}');

                    //                             docOrder.update({
                    //                               'feedback': feedbackC.text
                    //                             });
                    //                             Navigator.pop(context);
                    //                             setState(() {});
                    //                           },
                    //                         ).show();
                    //                       },
                    //                       icon: Icon(
                    //                         Icons.send,
                    //                         size: 20,
                    //                       )),
                    //                 )),
                    //           ],
                    //         )
                    //       : Text(': ${widget.feedback}',
                    //           maxLines: 4, style: TextStyle(fontSize: 18)),
                    // ])
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
