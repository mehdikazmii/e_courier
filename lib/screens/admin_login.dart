import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/screens/admin_home.dart';
import 'package:untitled5/screens/admin_navbar.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/inputWidget.dart';
import 'package:untitled5/widgets/loading.dart';
import 'package:untitled5/widgets/pressedWidgets.dart';
import 'package:untitled5/widgets/s.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  String email = "admin@gmail.com";
  String password = "123456";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBody(context),
        resizeToAvoidBottomInset: false,
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
              'Admin login',
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
            input('Email', _emailController),
            SizedBox(height: size.height * 0.01),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Password',
                style: style2,
              ),
            ),
            input('Password', _passwordController),
            SizedBox(height: size.height * 0.05),
            if (isLoading)
              loading()
            else
              customButton(
                'Login',
                () {
                  if (_emailController.text == email) {
                    if (_passwordController.text == password) {
                      Get.offAll(const AdminNavBar());
                    } else {
                      S.sSnackBar(
                          message: 'Something is went Wrong in Admin Login');
                    }
                  }
                },
              ),
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
}
