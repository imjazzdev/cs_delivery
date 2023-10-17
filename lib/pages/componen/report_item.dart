import 'package:flutter/material.dart';

class ReportItem extends StatefulWidget {
  final int id;

  final String customer;

  final String harga;

  final String telp;

  final String luas;

  final String tgl_pesan;

  final String tgl_selesai;
  final String petugas;

  final bool isRumah;

  const ReportItem(
      {super.key,
      required this.id,
      required this.customer,
      required this.harga,
      required this.telp,
      required this.luas,
      required this.tgl_pesan,
      required this.tgl_selesai,
      required this.isRumah,
      required this.petugas});

  @override
  State<ReportItem> createState() => _ReportItemState();
}

class _ReportItemState extends State<ReportItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [Colors.red.shade200, Colors.red.shade100]),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(10),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                TableRow(children: [
                  Text(
                    'Id',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${widget.id}',
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Customer',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.customer,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Harga',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.harga,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Telp',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.telp,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Luas',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${widget.luas} m2',
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Tgl pesan',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.tgl_pesan,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Tgl selesai',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.tgl_selesai,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Petugas',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.petugas,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
              ],
            )),
        Positioned(
            top: 10,
            right: 10,
            child: Image.asset(
              widget.isRumah
                  ? 'assets/img/house.png'
                  : 'assets/img/workplace.png',
              height: 50,
            ))
      ],
    );
  }
}
