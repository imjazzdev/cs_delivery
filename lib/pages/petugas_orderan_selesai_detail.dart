import 'package:flutter/material.dart';

class PetugasOrderanSelesaiDetail extends StatelessWidget {
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

  const PetugasOrderanSelesaiDetail(
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
                'Order ${id}',
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
                        ': $nama',
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Telp',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(': $telp', style: TextStyle(fontSize: 18))
                    ]),
                    TableRow(children: [
                      Text(
                        'Alamat',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(': $domisili',
                              style: TextStyle(fontSize: 18))),
                    ]),
                    TableRow(children: [
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ': $email',
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
                        ": $luas m2",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Harga',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": $harga",
                        style: TextStyle(fontSize: 16),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Tgl Pemesanan',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": $tanggal_pemesanan",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Tgl Selesai',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": $tanggal_selesai",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Petugas',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": $petugas",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'Catatan',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ": $catatan",
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                    // TableRow(children: [
                    //   Text(
                    //     'Feedback',
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    //   Text(feedback == '' ? ': - ' : ': ${feedback}',
                    //       maxLines: 4, style: TextStyle(fontSize: 18))
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
