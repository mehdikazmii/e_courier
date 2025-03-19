import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Requests')
      .orderBy('timeStamp', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                elevation: 3,
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
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              FsRepo.requestStatus(document, 'Yes');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: data['status'] == 'Yes'
                                    ? primaryColor
                                    : Colors.red),
                            child: data['status'] == 'No'
                                ? const Text('Accept request')
                                : const Text('Accepted'),
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

  makeCall(String number) {
    String phoneNo = 'tel:' + number;
    launch(phoneNo);
  }
}
