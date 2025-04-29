import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:untitled5/helper/constant.dart';
import 'package:untitled5/screens/about_us.dart';
import 'package:untitled5/screens/chat.dart';
import 'package:untitled5/screens/dwr.dart';
import 'package:untitled5/screens/history_page.dart';
import 'package:untitled5/screens/pickup_schedule.dart';
import 'package:untitled5/screens/privacyPolicy.dart';
import 'package:untitled5/screens/track.dart';
import 'package:untitled5/screens/chatbot_screen.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      endDrawer: DrawerOne(),
      body: Stack(
        children: [
          ListView(
            children: [
              ShapeOfView(
                elevation: 4,
                height: 190,
                width: double.infinity,
                shape: DiagonalShape(
                  position: DiagonalPosition.Bottom,
                  direction: DiagonalDirection.Right,
                  angle: DiagonalAngle.deg(angle: 0),
                ),
                child: Container(
                  color: primaryColor,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Image(
                            image: AssetImage('assets/ecourierlogo.png'),
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Card(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(13),
              //           ),
              //           elevation: 5,
              //           child: InkWell(
              //             onTap: () {
              //               Get.to(const PickUp());
              //             },
              //             borderRadius: BorderRadius.circular(13),
              //             child: Center(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(vertical: 20),
              //                 child: Column(
              //                   children: [
              //                     const CircleAvatar(
              //                       backgroundColor: tertiaryColor,
              //                       radius: 32,
              //                       child: Icon(
              //                         Icons.car_repair,
              //                         size: 40,
              //                         color: Colors.white,
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       height: 20,
              //                     ),
              //                     Text(
              //                       'Pick Up',
              //                       style: style2.copyWith(
              //                           fontWeight: FontWeight.w900,
              //                           color: secondaryColor),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Card(
              //           elevation: 5,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(13),
              //           ),
              //           child: InkWell(
              //             onTap: () {
              //               Get.to(const Track());
              //             },
              //             borderRadius: BorderRadius.circular(13),
              //             child: Center(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(vertical: 20),
              //                 child: Column(
              //                   children: [
              //                     const CircleAvatar(
              //                       backgroundColor: Colors.red,
              //                       radius: 32,
              //                       child: Icon(
              //                         Icons.track_changes_rounded,
              //                         size: 35,
              //                         color: Colors.white,
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       height: 20,
              //                     ),
              //                     Text(
              //                       'Tracking ID',
              //                       style: style2.copyWith(
              //                           fontWeight: FontWeight.w900,
              //                           color: secondaryColor),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: InkWell(
                          onTap: () {
                            makeCall(aadilContact);
                          },
                          borderRadius: BorderRadius.circular(13),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 32,
                                    child: Icon(
                                      Icons.call,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Phone',
                                    style: style2.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: secondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(const Privacy());
                          },
                          borderRadius: BorderRadius.circular(13),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.purple,
                                    radius: 32,
                                    child: Icon(
                                      Icons.privacy_tip,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Privacy Policy',
                                    style: style2.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: secondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Card(
              //           elevation: 5,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(13),
              //           ),
              //           child: InkWell(
              //             onTap: () {
              //               Get.to(Chat(FsRepo.loggedInUser!.uid));
              //             },
              //             borderRadius: BorderRadius.circular(13),
              //             child: Center(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(vertical: 20),
              //                 child: Column(
              //                   children: [
              //                     const CircleAvatar(
              //                       backgroundColor: Colors.blue,
              //                       radius: 32,
              //                       child: Icon(
              //                         Icons.chat_rounded,
              //                         size: 33,
              //                         color: Colors.white,
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       height: 20,
              //                     ),
              //                     Text(
              //                       'Chat',
              //                       style: style2.copyWith(
              //                           fontWeight: FontWeight.w900,
              //                           color: secondaryColor),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Card(
              //           elevation: 5,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(13),
              //           ),
              //           child: InkWell(
              //             onTap: () {
              //               Get.to(HistoryPage());
              //             },
              //             borderRadius: BorderRadius.circular(13),
              //             child: Center(
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(vertical: 20),
              //                 child: Column(
              //                   children: [
              //                     const CircleAvatar(
              //                       backgroundColor: Colors.brown,
              //                       radius: 32,
              //                       child: Icon(
              //                         Icons.history,
              //                         size: 35,
              //                         color: Colors.white,
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       height: 20,
              //                     ),
              //                     Text(
              //                       'History',
              //                       style: style2.copyWith(
              //                           fontWeight: FontWeight.w900,
              //                           color: secondaryColor),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(AboutUs());
                          },
                          borderRadius: BorderRadius.circular(13),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: secondaryColor,
                                    radius: 32,
                                    child: Icon(
                                      Icons.info_outline,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'About',
                                    style: style2.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: secondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: InkWell(
                          onTap: () {
                            FsRepo.logout();
                          },
                          borderRadius: BorderRadius.circular(13),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 32,
                                    child: Icon(
                                      Icons.logout,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Logout',
                                    style: style2.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: secondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
          // Positioned(
          //   right: 16.0,
          //   bottom: 16.0,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       Get.to(() => const ChatbotScreen());
          //     },
          //     backgroundColor: primaryColor,
          //     child: const Icon(Icons.chat, color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: primaryColor,
      centerTitle: true,
      title: Text(
        'E-Courier',
        style: style1.copyWith(color: Colors.white),
      ),
    );
  }

  makeCall(String number) {
    String phoneNo = 'tel:' + number;
    launch(phoneNo);
  }
}
