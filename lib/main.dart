import 'package:cs_delivery/pages/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CS Delivery',
        home: const SignInPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            appBarTheme: AppBarTheme(
                //titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
                backgroundColor: Colors.grey.shade100,
                elevation: 0,
                centerTitle: true),
            scaffoldBackgroundColor: Colors.grey.shade100));
  }
}
