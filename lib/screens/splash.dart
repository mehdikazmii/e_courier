import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/screens/UserAdmin.dart';
import 'package:untitled5/screens/onboardings.dart';
import 'package:untitled5/widgets/loading.dart';

class Splash extends StatefulWidget {
  static String id = "Splash";

  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool value = pref.containsKey('key');

    if (value == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const UserAdmin();
          },
        ),
            (r) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const OnBoardingPage();
          },
        ),
            (r) => false,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/ecourierlogo.png'),
              width: 300,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: 100,child: Center(
        child: loading2(),
      ),),
    );
  }
}
