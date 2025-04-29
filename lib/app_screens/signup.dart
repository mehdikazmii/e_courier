import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled5/app_screens/home.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/services/pref.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/inputWidget.dart';
import 'package:untitled5/widgets/loading.dart';
import 'package:untitled5/widgets/pressedWidgets.dart';
import 'package:untitled5/widgets/s.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBody(context),
        bottomNavigationBar: getBottomAlreadyHaveAccount(),
      ),
    );
  }

  getBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            upperLogo(),
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              'Signup',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: secondaryColor),
            )),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Name',
                style: style2,
              ),
            ),
            input('Name', nameController),
            SizedBox(height: size.height * 0.01),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Email',
                style: style2,
              ),
            ),
            input('Email', emailController),
            SizedBox(height: size.height * 0.01),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Password',
                style: style2,
              ),
            ),
            input('Password', passwordController),
            SizedBox(height: size.height * 0.01),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Phone',
                style: style2,
              ),
            ),
            input('Phone', phoneController),
            SizedBox(height: size.height * 0.06),
            isLoading
                ? loading()
                : customButton(
                    'SignUp',
                    () {
                      onSignUpTap();
                    },
                  ),
          ],
        ),
      ),
    );
  }

  onSignUpTap() async {
    if (nameController.text.isEmpty) {
      S.sSnackBar(message: 'Name Required!');
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      S.sSnackBar(message: 'Valid Email Required!');
      return;
    }
    if (passwordController.text.length < 6) {
      S.sSnackBar(message: 'Password must be contain 6 character!');
      return;
    }
    setState(() {
      isLoading = true;
    });
    bool result = await FsRepo.registerUser(
      nameController.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
    );
    if (result) {
      Pref.setPrefString(Pref.username, emailController.text);
      Pref.setPrefString(Pref.password, passwordController.text);
      Get.offAll(const Home());
    }
    setState(() {
      isLoading = false;
    });
  }

  upperLogo() {
    return const Center(
      child: Image(
        image: AssetImage('assets/ecourierlogo.png'),
        width: 200,
      ),
    );
  }

  getBottomAlreadyHaveAccount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an Account! ',
            style: style3,
          ),
          InkWell(
              onTap: () {
                Get.back();
              },
              splashColor: secondaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Text(
                'Login',
                style: style1.copyWith(fontSize: 16, color: secondaryColor),
              )),
        ],
      ),
    );
  }
}
