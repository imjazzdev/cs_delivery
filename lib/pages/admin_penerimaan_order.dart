import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/admin_penerimaan_detail.dart';
import 'package:cs_delivery/pages/componen/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PenerimaanOrder extends StatelessWidget {
  final order = FirebaseFirestore.instance
      .collection('order')
      .where('status', isEqualTo: 'Diterima');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Order Diterima',
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
                                          AdminPenerimaanDetail(
                                              id: e['id_order'],
                                              nama: e['nama'],
                                              telp: e['hp'],
                                              luas: e['luas'],
                                              harga: e['harga'],
                                              domisili: e['alamat'],
                                              tanggal_penerimaan:
                                                  e['tanggal_pemesanan'],
                                              email: e['email']),
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
