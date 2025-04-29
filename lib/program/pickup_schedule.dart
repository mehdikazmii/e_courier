import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/models/cities_list.dart';
import 'package:untitled5/app_screens/home.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/inputWidget.dart';
import 'package:untitled5/widgets/loading.dart';
import 'package:untitled5/widgets/pressedWidgets.dart';
import 'package:untitled5/widgets/s.dart';

class PickUp extends StatefulWidget {
  const PickUp({Key? key}) : super(key: key);

  @override
  State<PickUp> createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController shipperAddressController = TextEditingController();
  TextEditingController pickUpAddressController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? selectFromAddress;
  String? selectToAddress;
  bool isUploading = false;
  String price = "480";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: input2('Name', nameController),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: input2('Email', emailController),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: input2('Phone', phoneController),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: DropdownButton(
                    value: selectFromAddress,
                    hint: const Padding(
                      padding: EdgeInsets.only(left: 26),
                      child: Text(
                        'City from',
                        style: style2,
                      ),
                    ),
                    iconSize: 30,
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.expand_more,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectFromAddress = newValue!;
                      });
                    },
                    items: selectCitiesList.map((valueItems) {
                      return DropdownMenuItem<String>(
                        value: valueItems,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            valueItems,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2),
                  child: DropdownButton(
                    value: selectToAddress,
                    hint: const Padding(
                      padding: EdgeInsets.only(left: 26),
                      child: Text(
                        'City to',
                        style: style2,
                      ),
                    ),
                    iconSize: 30,
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.expand_more,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectToAddress = newValue!;
                      });
                    },
                    items: selectCitiesList.map((valueItems) {
                      return DropdownMenuItem<String>(
                        value: valueItems,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            valueItems,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: input2('Shipper address', shipperAddressController),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: input2('Pick up address', pickUpAddressController),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: input2('Weight(kg)', weightController),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                weightController.text == null || selectToAddress == null
                    ? Text(
                        "Total price : 00    ",
                        style: style2.copyWith(fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "Total price : $price    ",
                        style: style2.copyWith(fontWeight: FontWeight.bold),
                      ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            isUploading
                ? loading()
                : customButton('Create Request', onCreateRequest),
          ],
        ),
      ),
    );
  }

  void onCreateRequest() async {
    if (nameController.text.isEmpty) {
      S.sSnackBar(message: 'Please enter name');
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      S.sSnackBar(message: 'Valid Email Required!');
      return;
    }
    if (phoneController.text.isEmpty) {
      S.sSnackBar(message: 'Please enter phone');
      return;
    }
    if (selectFromAddress == null) {
      S.sSnackBar(message: 'Please select city From');
      return;
    }
    if (selectToAddress == null) {
      S.sSnackBar(message: 'Please select city To');
      return;
    }
    if (shipperAddressController.text.isEmpty) {
      S.sSnackBar(message: 'Please enter shipper address');
      return;
    }
    if (pickUpAddressController.text.isEmpty) {
      S.sSnackBar(message: 'Please enter pickup address');
      return;
    }
    if (weightController.text.isEmpty) {
      S.sSnackBar(message: 'Please enter correct weight');
      return;
    }

    setState(() {
      isUploading = true;
    });

    bool result = await FsRepo.createRequest(
        FsRepo.loggedInUser?.uid,
        emailController.text,
        phoneController.text,
        selectFromAddress,
        selectToAddress,
        shipperAddressController.text,
        pickUpAddressController.text,
        weightController.text,
        price);
    if (result) {
      Get.offAll(const Home());
      S.sSnackBar(message: 'Post Uploaded...');
    }
    setState(() {
      isUploading = true;
    });
  }

  getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: primaryColor,
      centerTitle: true,
      title: Text(
        'Pick Up',
        style: style1.copyWith(color: Colors.white),
      ),
    );
  }
}
