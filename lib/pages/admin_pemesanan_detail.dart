import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdminPemesananDetail extends StatelessWidget {
  final int id;
  final String nama;
  final String telp;
  final String domisili;
  final String email;
  final String luas;
  final String harga;
  final String tanggal;
  const AdminPemesananDetail(
      {required this.id,
      required this.nama,
      required this.telp,
      required this.luas,
      required this.harga,
      required this.domisili,
      required this.tanggal,
      required this.email});

  @override
  Widget build(BuildContext context) {
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
                'Order $id',
                style: TextStyle(fontSize: 30),
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ': $nama',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(': $telp', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(': $domisili', style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ': $email',
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": $luas m2",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": $harga",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": $tanggal",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
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
