import 'package:cs_delivery/pages/admin_home.dart';
import 'package:cs_delivery/pages/feedback.dart';
import 'package:cs_delivery/pages/kebersihan_kantor.dart';
import 'package:cs_delivery/pages/kebersihan_rumah.dart';
import 'package:cs_delivery/pages/user_feedback.dart';
import 'package:cs_delivery/pages/user_orderan_selesai.dart';
import 'package:cs_delivery/pages/user_pemesanan_order.dart';
import 'package:cs_delivery/pages/user_penerimaan_order.dart';
import 'package:cs_delivery/pages/user_person.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });
  }

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
              'Dashboard',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(
                        routes: const KebersihanRumah(),
                        img: 'assets/img/house.png',
                        judul: 'Kebersihan\nRumah'),
                    MenuItem(
                        routes: KebersihanKantor(),
                        img: 'assets/img/workplace.png',
                        judul: 'Kebersihan\nKantor'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(
                        routes: UserPemesananOrder(),
                        img: 'assets/img/personal-information.png',
                        judul: 'Pemesanan\nOrder'),
                    MenuItem(
                        routes: UserPemerimaanOrder(),
                        img: 'assets/img/recruitment.png',
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
                        routes: UserOrderanSelesai(),
                        img: 'assets/img/verify.png',
                        judul: 'Orderan\nSelesai'),
                    MenuItem(
                        routes: UserFeedback(),
                        img: 'assets/img/chat.png',
                        judul: 'Feedback'),
                  ],
                ),
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
                    MaterialPageRoute(builder: (context) => UserPerson()));
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
