import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cs_delivery/pages/admin_home.dart';
import 'package:cs_delivery/pages/petugas_home.dart';
import 'package:cs_delivery/pages/signup.dart';
import 'package:cs_delivery/pages/user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool _obscuretxt = false;

  @override
  Widget build(BuildContext context) {
    print('USER SAAT INI ${FirebaseAuth.instance.currentUser}');
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                  child: TextField(
                      controller: emailC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Email'))),
              SizedBox(
                height: 15,
              ),
              Flexible(
                  child: Stack(
                children: [
                  TextField(
                      controller: passwordC,
                      obscureText: _obscuretxt,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      )),
                  Positioned(
                    top: 8,
                    right: 4,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscuretxt = !_obscuretxt;
                          });
                          print('obsure txt : $_obscuretxt');
                        },
                        icon: Icon(_obscuretxt
                            ? Icons.visibility_off
                            : Icons.remove_red_eye)),
                  )
                ],
              )),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailC.text, password: passwordC.text);
                      if (FirebaseAuth.instance.currentUser!.email ==
                          'farhan@gmail.com') {
                        print(
                            'USER TERKINI ${FirebaseAuth.instance.currentUser}');
                        CircularProgressIndicator();
                        await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminHomePage(),
                            ),
                            (route) => false);
                      } else if (FirebaseAuth.instance.currentUser!.email ==
                              'galih@gmail.com' ||
                          FirebaseAuth.instance.currentUser!.email ==
                              'fajar@gmail.com') {
                        print(
                            'USER TERKINI ${FirebaseAuth.instance.currentUser}');
                        CircularProgressIndicator();
                        await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetugasHome(),
                            ),
                            (route) => false);
                      } else {
                        print(
                            'USER TERKINI ${FirebaseAuth.instance.currentUser}');
                        await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserHome(),
                            ),
                            (route) => false);
                      }
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.toString()),
                        backgroundColor: Colors.orange.shade400,
                      ));
                    }
                  },
                  child: Text(
                    'Sign In',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: emailC.text);
                          await ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: Text('Check your email'),
                            backgroundColor: Colors.grey.shade800,
                          ));
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: Colors.orange.shade400,
                          ));
                        }
                      },
                      child: const Text('Forgot password?')),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Text('Sign Up'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
