import 'package:flutter/material.dart';

class Common {
  static Widget textFiled(
      {String? text, TextEditingController? controller, Widget? icon}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: icon,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }

  static Widget container({required String text, Color? color, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
