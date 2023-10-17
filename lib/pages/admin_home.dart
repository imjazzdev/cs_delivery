import 'package:cs_delivery/pages/admin_data_karyawan.dart';
import 'package:cs_delivery/pages/admin_data_user.dart';
import 'package:cs_delivery/pages/admin_orderan_selesai.dart';
import 'package:cs_delivery/pages/admin_pemesanan_order.dart';
import 'package:cs_delivery/pages/admin_penerimaan_order.dart';

import 'package:cs_delivery/pages/admin_profile.dart';
import 'package:cs_delivery/pages/admin_report.dart';
import 'package:cs_delivery/pages/feedback.dart';
import 'package:cs_delivery/pages/kebersihan_kantor.dart';
import 'package:cs_delivery/pages/kebersihan_rumah.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Dashboard Admin',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     MenuItem(
                //         routes: KebersihanRumah(),
                //         img: 'assets/img/house.png',
                //         judul: 'Kebersihan\nRumah'),
                //     MenuItem(
                //         routes: KebersihanKantor(),
                //         img: 'assets/img/workplace.png',
                //         judul: 'Kebersihan\nKantor'),
                //   ],
                // ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(
                        routes: DataUserPage(),
                        img: 'assets/img/personal-information.png',
                        judul: 'Data\nUser'),
                    MenuItem(
                        routes: DataKaryawanPage(),
                        img: 'assets/img/recruitment.png',
                        judul: 'Data\nKaryawan'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(
                        routes: PemesananOrder(),
                        img: 'assets/img/pemesanan.png',
                        judul: 'Pemesanan\nOrder'),
                    MenuItem(
                        routes: PenerimaanOrder(),
                        img: 'assets/img/penerimaan.png',
                        judul: 'Penerimaan\nOrder'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(
                        routes: AdminOrderanSelesai(),
                        img: 'assets/img/verify.png',
                        judul: 'Orderan\nSelesai'),
                    MenuItem(
                        routes: FeedbackPage(),
                        img: 'assets/img/chat.png',
                        judul: 'Feedback\nCustomer'),
                  ],
                ),

                MenuItem(
                    routes: AdminReport(),
                    img: 'assets/img/report.png',
                    judul: 'Report\nOrder'),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/img/home.png',
                  height: 50,
                ),
                Text('Home')
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/profile.png',
                    height: 50,
                  ),
                  Text('Profile')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String judul;
  final String img;
  final Widget routes;
  MenuItem({required this.img, required this.judul, required this.routes});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => routes));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 75,
            child: Image.asset(img),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            judul,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
