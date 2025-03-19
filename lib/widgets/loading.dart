import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled5/theme/constant.dart';

Widget loading() {
  return SpinKitCircle(
    size: 40.0,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? primaryColor : secondaryColor,
        ),
      );
    },
  );
}
Widget loading2() {
  return const SpinKitDoubleBounce(
    color: tertiaryColor,
    size: 50.0,

  );
}
