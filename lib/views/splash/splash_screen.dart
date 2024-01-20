import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noviindus/core/color.dart';
import 'package:noviindus/core/constant.dart';
import 'package:noviindus/views/auth/login.dart';
import 'package:noviindus/views/home/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late bool isLogin;
  @override
  void initState() {
    super.initState();

    checkLoginStatus();

    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => const ProfileSelecting(),
    // ));
  }

  checkLoginStatus() async {
    final SharedPreferences sharedPrefer =
        await SharedPreferences.getInstance();
    isLogin = sharedPrefer.containsKey('token');

    await Future.delayed(const Duration(seconds: 4));
    if (isLogin) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorRed,
      body: Container(
        color: colorRed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/image 1.png',
                width: 270,
              ),
            ),
            kHeight20,
            const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Color.fromARGB(255, 247, 244, 243),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
