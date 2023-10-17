import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_delivery/pages/componen/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../utils/utils.dart';
import 'componen/report_item.dart';

class AdminReportDetail extends StatelessWidget {
  final order = FirebaseFirestore.instance
      .collection('order')
      .where('status', isEqualTo: 'Selesai');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
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
                  children: snapshot.data!.docs
                      .map((e) => ReportItem(
                            id: e['id_order'] ?? 9,
                            customer: e['nama'] ?? 'Ijul',
                            harga: e['harga'] ?? 'Rp 70.000',
                            luas: e['luas'] ?? '10',
                            telp: e['hp'] ?? '0987864567',
                            tgl_pesan: e['tanggal_pemesanan'] ?? '13-10-2025',
                            tgl_selesai: e['tanggal_selesai'] ?? '13-10-2027',
                            petugas: e['petugas'],
                            isRumah: e['rumah'] ?? true,
                          ))
                      .toList(),
                );
              } else if (snapshot.hasData != true) {
                return Center(child: Text('BELUM ADA DATA'));
              } else {
                return Center(child: Text('Loading'));
              }
            }),
      ),
    );
  }
}
