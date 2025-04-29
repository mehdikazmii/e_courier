import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:untitled5/main.dart';
import 'package:untitled5/program/UserAdmin.dart';
import 'package:untitled5/services/pref.dart';
import 'package:untitled5/widgets/s.dart';

class FsRepo {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static const userCollectionName = 'Users';
  static const requestCollectionName = 'Requests';
  static const postCommentsCollectionName = 'PostsComments';

  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection(userCollectionName);
  static CollectionReference requestCollection =
      FirebaseFirestore.instance.collection(requestCollectionName);
  static CollectionReference postCommentsCollection =
      FirebaseFirestore.instance.collection(postCommentsCollectionName);

  static DocumentSnapshot? currentUser;
  static DocumentSnapshot? lastLoginUser;
  static DocumentSnapshot? groupSnapshot;
  static List<DocumentSnapshot> listUserStatusDocumentSnapshot = [];
  static List<DocumentSnapshot> listUserChatDocumentSnapshot = [];

  static User? loggedInUser;

  static Future<void> createUser(id, name, email, password, phone) async {
    userCollection.doc(id).set({
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'playerId': playerId ?? '',
    });
  }

  static Future<bool> registerUser(name, email, password, phone) async {
    try {
      loggedInUser = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (loggedInUser != null) {
        await createUser(loggedInUser?.uid, name, email, password, phone);
        currentUser = await userCollection.doc(loggedInUser?.uid).get();
        return true;
      }
      return false;
    } catch (e) {
      S.sSnackBar(message: e.toString());
      return false;
    }
  }

  static Future<User?> login(email, password) async {
    try {
      loggedInUser = (await auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (loggedInUser != null) {
        await FsRepo.userCollection
            .doc(FsRepo.loggedInUser?.uid)
            .update({'playerId': playerId});
        currentUser = await userCollection.doc(loggedInUser?.uid).get();
        return loggedInUser;
      }
    } catch (e) {
      S.sSnackBar(message: e.toString());
      return null;
    }
  }

  static Future<bool> createRequest(id, email, phone, cityFrom, cityTo,
      shipperAddress, pickUpAddress, weight, price) async {
    try {
      requestCollection.add({
        'id': id,
        'email': email,
        'phone': phone,
        'cityFrom': cityFrom,
        'cityTo': cityTo,
        'shipperAddress': shipperAddress,
        'pickUpAddress': pickUpAddress,
        'weight': weight,
        'price': price,
        'authorName': currentUser!['name'],
        'status': 'No',
        'timeStamp': DateTime.now().millisecondsSinceEpoch,
      });
      return true;
    } catch (e) {
      S.sSnackBar(message: e.toString());
      return false;
    }
  }

  static Future<void> requestStatus(DocumentSnapshot doc, requestStatus) async {
    try {
      requestCollection.doc(doc.id).update({'status': requestStatus}).then(
          (value) => S.sSnackBar(message: 'Request Accepted'));
    } catch (e) {
      S.sSnackBar(message: 'Failed!');
    }
  }

  static logout() async {
    currentUser = null;
    loggedInUser = null;
    await Pref.prefs!.clear();
    await auth.signOut();
    Get.offAll(const UserAdmin());
  }
}
