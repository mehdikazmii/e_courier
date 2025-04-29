import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:untitled5/app_screens/admin_login.dart';
import 'package:untitled5/app_screens/login.dart';
import 'package:untitled5/program/chatbot_screen.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/pressedWidgets.dart';

class UserAdmin extends StatelessWidget {
  const UserAdmin({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: OutlinedButton(
              onPressed: () {
                Get.to(const LoginAdmin());
              },
              child: const Text(
                'Admin',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ShapeOfView(
                  height: 400,
                  shape: TriangleShape(
                    percentBottom: 0.5,
                  ),
                  child: Container(
                    color: primaryColor,
                    child: Column(
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage('assets/ecourierlogo.png'),
                            width: 200,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        const Text(
                          "ECourier",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: customButton('Continue to e-courier', () {
                Get.to(const Login());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
