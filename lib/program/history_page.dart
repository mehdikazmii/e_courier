import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/program/lable.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/loading.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Requests')
      .orderBy('timeStamp', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: loading());
          }

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Card(
                elevation: 8,
                color: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Name:',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                data['authorName'],
                                style: style2.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Phone:',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                data['phone'],
                                style: style2.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'City:',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    data['cityFrom'],
                                    style: style2.copyWith(
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.5),
                                  ),
                                  const Text(' to '),
                                  Text(
                                    data['cityTo'],
                                    style: style2.copyWith(
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Weight:',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                data['weight'],
                                style: style2.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Price:',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                data['price'],
                                style: style2.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Address:',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                data['shipperAddress'],
                                style: style2.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Address:',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                data['pickUpAddress'],
                                style: style2.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      data['status'] == 'Yes'
                          ? OutlinedButton(
                              onPressed: () {
                                Get.to(
                                  Lable(
                                    name: data['authorName'],
                                    cityTo: data['cityTo'],
                                    cityFrom: data['cityFrom'],
                                    phone: data['phone'],
                                    shipperAddress: data['shipperAddress'],
                                    address: data['pickUpAddress'],
                                    price: data['price'],
                                  ),
                                );
                              },
                              child: const Text('Print Lable'),
                            )
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          data['status'] == 'No'
                              ? Container(
                                  color: tertiaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Pending',
                                      style:
                                          style3.copyWith(color: Colors.white),
                                    ),
                                  ),
                                )
                              : Container(
                                  color: primaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Approved',
                                      style:
                                          style3.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: primaryColor,
      centerTitle: true,
      title: Text(
        'History',
        style: style1.copyWith(color: Colors.white),
      ),
    );
  }
}
