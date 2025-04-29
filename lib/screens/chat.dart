import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:untitled5/helper/constant.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/loading.dart';
import 'package:untitled5/widgets/s.dart';
import 'package:url_launcher/url_launcher.dart';

class Chat extends StatefulWidget {
  final String postId;

  Chat(this.postId);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late String playerId;

  CollectionReference postCollection =
      FirebaseFirestore.instance.collection('Posts');
  CollectionReference postCommentsCollection =
      FirebaseFirestore.instance.collection('PostsComments');

  Future<bool> addMessage(String comment, postId) async {
    try {
      String id = S.sGetRandomString();
      postCommentsCollection.doc(id).set({
        'id': id,
        'comment': comment,
        'timeStamp': DateTime.now().millisecondsSinceEpoch,
        'uId': FsRepo.loggedInUser!.uid,
        'postId': postId,
        'authorName': FsRepo.currentUser!['name'],
        'authorId': FsRepo.currentUser!['id'],
        'phone': FsRepo.currentUser!['phone'],
      });
      int commentCount =
          (await postCollection.doc(postId).get())['commentCount'];
      commentCount += 1;
      postCollection.doc(postId).update({'commentCount': commentCount});
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  @override
  void initState() {
    getPlayerId();
    super.initState();
  }

  getPlayerId() async {
    String uId = (await FsRepo.userCollection.doc(widget.postId).get())['uId'];
    if (kDebugMode) {
      print(uId);
    }
    playerId = (await FsRepo.userCollection.doc(uId).get())['playerId'];
    if (kDebugMode) {
      print(playerId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Message',
          style: style1.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: () {
              makeCall(aadilContact);
            },
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      extendBodyBehindAppBar: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot>(
                stream: FsRepo.postCommentsCollection
                    .where('postId', isEqualTo: widget.postId)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: loading(),
                    );
                  } else {
                    List<DocumentSnapshot> list = snapshot.data.docs;
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
                        reverse: true,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) =>
                            _buildItem(list[index], context));
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: makeInput(
                      hintText: 'Enter Message',
                      controller: _chatController,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: onComment,
                    child: const CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 25,
                      child: Icon(
                        Icons.send_outlined,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makeInput({
    bool obscureText = false,
    hintText,
    suffixIcon,
    preFFixIcon,
    controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: hintText,
        hintStyle: const TextStyle(color: primaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  void onComment() async {
    if (_chatController.text.isEmpty) {
      S.sSnackBar(message: 'Nothing to send');
    } else {
      addMessage(_chatController.text, widget.postId);
      // await FsRepo.addComment(_chatController.text,widget.postId);
      scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      _chatController.clear();
    }
  }

  _buildItem(DocumentSnapshot item, BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftCenter,
      nipHeight: 15,
      color: Colors.grey[200],
      elevation: 1 * px,
      margin: const BubbleEdges.only(top: 8.0, right: 50.0, left: 5),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightCenter,
      nipHeight: 15,
      color: primaryColor,
      elevation: 1 * px,
      margin: const BubbleEdges.only(top: 8.0, left: 40.0, right: 5),
      alignment: Alignment.topRight,
    );

    TextStyle textStyle = const TextStyle(color: Colors.white);

    if (item['uId'] == FsRepo.loggedInUser!.uid) {
      return Bubble(
        style: styleMe,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['authorName'],
                style: style2.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 17)),
            const SizedBox(
              height: 4,
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 80),
              child: Text(
                item['comment'],
                style: textStyle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              S.sDateToString(
                  DateTime.fromMillisecondsSinceEpoch(item['timeStamp'])),
              style: const TextStyle(
                fontSize: 8.5,
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bubble(
                style: styleSomebody,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['authorName'], style: style2),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(item['comment']),
                    const SizedBox(
                      height: 9,
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        S.sDateToString(DateTime.fromMillisecondsSinceEpoch(
                            item['timeStamp'])),
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  makeCall(String number) {
    String phoneNo = 'tel:' + number;
    launch(phoneNo);
  }
}
