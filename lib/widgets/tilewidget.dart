import 'package:flutter/material.dart';
import 'package:untitled5/theme/constant.dart';

tileCards(String text, IconData icon, function, Color clr) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    elevation: 5,
    child: ListTile(
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ),
      title: Text(
        text,
      ),
      onTap: function,
    ),
  );
}
