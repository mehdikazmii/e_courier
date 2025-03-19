import 'package:flutter/material.dart';
import 'package:untitled5/theme/constant.dart';

Widget postButton(Function function) {
  return InkWell(
    onTap: () {},
    splashColor: Colors.white,
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(30),
        ),
        gradient: gradientColor,
      ),
      child: const Icon(
        Icons.check_outlined,
        color: Colors.red,
        size: 35,
      ),
    ),
  );
}

customButton(text, function) {
  return SizedBox(
    width: double.infinity,
    height: 45,
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shadowColor: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: primaryColor, width: 0.8)),
      ),
      child: Text(
        text,
      ),
    ),
  );
}
