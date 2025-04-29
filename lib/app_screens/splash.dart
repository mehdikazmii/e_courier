import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/program/UserAdmin.dart';
import 'package:untitled5/app_screens/onboardings.dart';
import 'package:untitled5/widgets/loading.dart';

class Splash extends StatefulWidget {
  static String id = "Splash";

  const Splash({Key? key}) : super(key: key);
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, navigationPage);
  }

  void navigationPage() async {
    final prefs = await SharedPreferences.getInstance();

    // guard against calling context if this State was already disposed
    if (!mounted) return;

    final next =
        prefs.containsKey('key') ? const UserAdmin() : const OnBoardingPage();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => next),
      (r) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/ecourierlogo.png'),
              width: 300,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Center(
          child: loading2(),
        ),
      ),
    );
  }
}
