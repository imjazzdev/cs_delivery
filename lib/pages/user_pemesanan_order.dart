import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/componen/item_container.dart';
import 'package:cs_delivery/pages/componen/shimmer_item.dart';
import 'package:cs_delivery/pages/user_detail_pemesanan.dart';
import 'package:cs_delivery/pages/user_detail_penerimaan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserPemesananOrder extends StatelessWidget {
  final order = FirebaseFirestore.instance
      .collection('order')
      .where('status', isEqualTo: 'Dipesan')
      .where(
        'user',
        isEqualTo: FirebaseAuth.instance.currentUser!.email.toString(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Dipesan',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
        stream: order.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              children: snapshot.data!.docs.map((e) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPemesananOrder(
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
                              title: 'Membatalkan Pesanan?',
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
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 40,
                          ))
                    ],
                  ),
                );
              }).toList(),
            );
          } else {
            return ShimmerItem();
          }
        },
      )),
    );
  }
}
