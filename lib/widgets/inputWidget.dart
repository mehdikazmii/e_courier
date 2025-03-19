import 'package:flutter/material.dart';
import 'package:untitled5/theme/constant.dart';

Widget input(hintText, TextEditingController controller) {
  return TextField(
    controller: controller,
    cursorColor: secondaryColor,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      fillColor: Colors.grey[150],
      contentPadding: const EdgeInsets.only(left: 30, top: 18, bottom: 18),
    ),
    style: style2.copyWith(color: Colors.black),
  );
}

Widget input2(hintText, TextEditingController controller) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13),
    ),
    child: TextField(
      controller: controller,
      cursorColor: secondaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 30, top: 18, bottom: 18),
      ),
    ),
  );
}
