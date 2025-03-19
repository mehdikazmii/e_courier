import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/theme/constant.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "About",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.info,
                  size: 100,
                  color: secondaryColor,
                ),
                SizedBox(height: 5,),
                Center(
                    child: Text(
                  'Version 2.0.0',
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
