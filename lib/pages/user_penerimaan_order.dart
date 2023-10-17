import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/componen/shimmer_item.dart';
import 'package:cs_delivery/pages/user_detail_penerimaan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'componen/item_container.dart';

class UserPemerimaanOrder extends StatelessWidget {
  final order = FirebaseFirestore.instance
      .collection('order')
      .where('status', isEqualTo: 'Diterima')
      .where(
        'user',
        isEqualTo: FirebaseAuth.instance.currentUser!.email.toString(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Diterima',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
        stream: order.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
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
                          builder: (context) => DetailOrder(
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 35,
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
