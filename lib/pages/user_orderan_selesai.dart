import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/componen/item_container.dart';
import 'package:cs_delivery/pages/user_orderan_selesai_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserOrderanSelesai extends StatelessWidget {
  final order = FirebaseFirestore.instance
      .collection('order')
      .where('status', isEqualTo: 'Selesai')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Orderan Selesai',
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
                  .map((e) => ItemContainer(
                          id: e['id_order'],
                          status: e['status'],
                          icon: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UserOrderanSelesaiDetail(
                                        id: e['id_order'],
                                        nama: e['nama'],
                                        telp: e['hp'],
                                        luas: e['luas'],
                                        harga: e['harga'],
                                        domisili: e['alamat'],
                                        tanggal_pemesanan:
                                            e['tanggal_pemesanan'],
                                        tanggal_selesai: e['tanggal_selesai'],
                                        email: e['email'],
                                        petugas: e['petugas'],
                                        catatan: e['catatan'],
                                        feedback: e['feedback'] ?? '',
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 30,
                                ))
                          ]))
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
