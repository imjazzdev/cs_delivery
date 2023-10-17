import 'package:cs_delivery/pages/admin_pemesanan_order.dart';
import 'package:cs_delivery/pages/admin_penerimaan_order.dart';
import 'package:cs_delivery/pages/feedback.dart';
import 'package:cs_delivery/pages/petugas_orderan_selesai.dart';
import 'package:cs_delivery/pages/petugas_person.dart';
import 'package:cs_delivery/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'admin_home.dart';
import 'petugas_penerimaan_order.dart';

class PetugasHome extends StatefulWidget {
  const PetugasHome({super.key});

  @override
  State<PetugasHome> createState() => _PetugasHomeState();
}

class _PetugasHomeState extends State<PetugasHome> {
  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser!.email == 'galih@gmail.com') {
      Utils.USER_NOW = 'Galih';
    } else if (FirebaseAuth.instance.currentUser!.email == 'fajar@gmail.com') {
      Utils.USER_NOW = 'Fajar';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Dashboard Petugas',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuItem(
                  routes: PetugasPenerimaanOrder(),
                  img: 'assets/img/penerimaan.png',
                  judul: 'Penerimaan\nOrder',
                ),
                MenuItem(
                  routes: PetugasOrderanSelesai(),
                  img: 'assets/img/verify.png',
                  judul: 'Orderan\nSelesai',
                )
              ],
            ),
            MenuItem(
                routes: FeedbackPage(),
                img: 'assets/img/chat.png',
                judul: 'Feedback\nCustomer'),
          ],
        ),
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
                    MaterialPageRoute(builder: (context) => PetugasPerson()));
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
