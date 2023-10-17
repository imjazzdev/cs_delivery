import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/admin_pemesanan_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'componen/item_container.dart';

class PemesananOrder extends StatelessWidget {
  final order = FirebaseFirestore.instance
      .collection('order')
      .where('status', isEqualTo: 'Dipesan');
  Future updateStatus(String id) async {
    final doc = FirebaseFirestore.instance.collection('order').doc(id);
    doc.update({'status': 'Diterima'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Dipesan',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: order.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              children: snapshot.data!.docs
                  .map((e) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminPemesananDetail(
                                    id: e['id_order'],
                                    nama: e['nama'],
                                    telp: e['hp'],
                                    luas: e['luas'],
                                    harga: e['harga'],
                                    domisili: e['alamat'],
                                    tanggal: e['tanggal_pemesanan'],
                                    email: e['email']),
                              ));
                        },
                        child: ItemContainer(
                            id: e['id_order'],
                            status: e['status'],
                            icon: [
                              IconButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.warning,
                                      title: 'Terima Order ${e['id_order']} ?',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        updateStatus(e['id_order'].toString());
                                      },
                                    ).show();
                                  },
                                  icon: Icon(
                                    Icons.check,
                                    size: 35,
                                    color: Colors.blue,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.warning,
                                      title: 'Tolak Order ${e['id_order']} ?',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        FirebaseFirestore.instance
                                            .collection('order')
                                            .doc(e['id_order'].toString())
                                            .delete();
                                      },
                                    ).show();
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    size: 35,
                                    color: Colors.red,
                                  )),
                            ]),
                      ))
                  .toList(),
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
