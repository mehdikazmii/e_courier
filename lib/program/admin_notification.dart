import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/inputWidget.dart';
import 'package:untitled5/widgets/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminNotifications extends StatefulWidget {
  AdminNotifications({Key? key}) : super(key: key);

  @override
  State<AdminNotifications> createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('PostsComments')
      .orderBy('timeStamp', descending: true)
      .snapshots();

  TextEditingController replyController = TextEditingController();

  bool isReply = false;
  final TextEditingController _chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late String playerId;

  CollectionReference postCollection =
      FirebaseFirestore.instance.collection('Posts');
  CollectionReference postCommentsCollection =
      FirebaseFirestore.instance.collection('PostsComments');

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
                            const Text(
                              'Name : ',
                            ),
                            Text(
                              data['authorName'],
                              style: style2.copyWith(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        data['comment'],
                        style: style2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        data['phone'],
                        style: style2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 30,
                          child: IconButton(
                            onPressed: () {
                              makeCall(data['phone']);
                            },
                            icon: const Icon(Icons.call),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
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
