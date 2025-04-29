import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled5/program/UserAdmin.dart';
import 'package:untitled5/app_screens/home.dart';
import 'package:untitled5/app_screens/signup.dart';
import 'package:untitled5/services/firestore_repositary.dart';
import 'package:untitled5/services/pref.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/inputWidget.dart';
import 'package:untitled5/widgets/loading.dart';
import 'package:untitled5/widgets/pressedWidgets.dart';
import 'package:untitled5/widgets/s.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBody(context),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: getBottomNotHaveAccount(),
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
              'Login',
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
            SizedBox(height: size.height * 0.05),
            isLoading
                ? loading()
                : customButton('Login', () {
                    onLogInTap();
                  }),
          ],
        ),
      ),
    );
  }

  upperLogo() {
    return const Center(
      child: Image(
        image: AssetImage('assets/ecourierlogo.png'),
        width: 200,
      ),
    );
  }

  onLogInTap() async {
    if (kDebugMode) {
      if (emailController.text.isEmpty) {
        emailController.text = 'aadil@test.com';
      }
      if (passwordController.text.isEmpty) {
        passwordController.text = '123456';
      }
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
    FsRepo.loggedInUser =
        await FsRepo.login(emailController.text, passwordController.text);
    if (FsRepo.loggedInUser != null) {
      setState(() {
        isLoading = false;
      });
      await Pref.getPref();
      Pref.setPrefString(Pref.username, emailController.text);
      Pref.setPrefString(Pref.password, passwordController.text);
      Get.offAll(const Home());
    }
    setState(() {
      isLoading = false;
    });
  }

  getBottomNotHaveAccount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account! ',
            style: style3,
          ),
          InkWell(
            onTap: () {
              Get.to(const SignUp());
            },
            splashColor: secondaryColor,
            borderRadius: BorderRadius.circular(15),
            child: Text(
              'SignUp',
              style: style1.copyWith(fontSize: 16, color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
