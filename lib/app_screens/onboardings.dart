import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/program/UserAdmin.dart';
import 'package:untitled5/theme/constant.dart';

class OnBoardingPage extends StatefulWidget {
  static String id = 'OnBoardingPage';

  const OnBoardingPage({Key? key}) : super(key: key);
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('key', 'true');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const UserAdmin();
        },
      ),
      (r) => false,
    );
  }

  // void _onIntroEnd(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => Login()),
  //   );
  // }

  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 13.0,
      color: Colors.black,
      wordSpacing: 1,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.w700, color: primaryColor),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "About E-Courier",
          body:
              "E Couruer app is used to transfer your luggage, any kind of parcel from one place to any other place ",
          image: _buildImage('o1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Our Purpose",
          body:
              "Our main purpose is to provide ease to people for transfer luggage from one place to another place from their door steps.",
          image: _buildImage('o2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Benefits",
          body:
              "We provides you the benefit of picking up the parcels from your door step and drop the parcel at the door step",
          image: _buildImage('o3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      dotsFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: Container(),
      next: const Icon(
        Icons.arrow_forward,
        color: primaryColor,
      ),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: primaryColor)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(12),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(12.0, 8.0),
        color: Color(0xFFBDBDBD),
        activeColor: primaryColor,
        activeSize: Size(60.0, 5.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
