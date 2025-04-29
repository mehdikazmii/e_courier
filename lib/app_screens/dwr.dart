import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:untitled5/app_screens/about_us.dart';
import 'package:untitled5/program/history_page.dart';
import 'package:untitled5/program/pickup_schedule.dart';
import 'package:untitled5/app_screens/privacyPolicy.dart';
import 'package:untitled5/program/track.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/tilewidget.dart';

class DrawerOne extends StatefulWidget {
  static String id = "DrawerOne";

  @override
  _DrawerOneState createState() => _DrawerOneState();
}

class _DrawerOneState extends State<DrawerOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(gradient: gradientColor),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ShapeOfView(
                  elevation: 4,
                  height: 230,
                  width: double.infinity,
                  shape: DiagonalShape(
                    position: DiagonalPosition.Bottom,
                    direction: DiagonalDirection.Right,
                    angle: DiagonalAngle.deg(angle: 10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        FsRepo.currentUser!['name'],
                        style: const TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        FsRepo.currentUser!['email'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // tileCards('Pick Up', Icons.car_repair, () {
                //   Get.back();
                //   Get.to(const PickUp());
                // }, Colors.blue),
                // tileCards('Track', Icons.track_changes_rounded, () {
                //   Get.back();
                //   Get.to(const Track());
                // }, Colors.red),
                // tileCards('History', Icons.history, () {
                //   Get.back();
                //   Get.to(HistoryPage());
                // }, Colors.orange),
                tileCards('Privacy Policy', Icons.privacy_tip_outlined, () {
                  Get.back();
                  Get.to(const Privacy());
                }, Colors.blueAccent),
                tileCards('About', Icons.info, () {
                  Get.back();
                  Get.to(AboutUs());
                }, Colors.orange),
                tileCards('Logout', Icons.logout, () {
                  FsRepo.logout();
                }, Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
