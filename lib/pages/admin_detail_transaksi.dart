import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailTransaksi extends StatelessWidget {
  final String? id;
  final String? nama;
  final String? telp;
  final String? domisili;
  final String? email;
  final String? luas;
  final String? harga;
  final String? tanggal;
  const DetailTransaksi(
      {this.id,
      this.nama,
      this.telp,
      this.luas,
      this.harga,
      this.domisili,
      this.tanggal,
      this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Order ${id!}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              nama!,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(telp!, style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 10,
            ),
            Text(domisili!, style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 10,
            ),
            Text(email!, style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 10,
            ),
            Text(
              "Luas ${luas!}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Harga Rp${harga!}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tanggal Pemesanan : ${tanggal!}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
