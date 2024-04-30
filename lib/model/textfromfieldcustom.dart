import 'package:flutter/material.dart';

textFromFieldcustom({
  bool backgroundAnable = false,
  bool rtl = false,
  bool pass = false,
  maxLines = 1,
  TextInputType keyboardType = TextInputType.name,
  length = false,
  double width = 120,
  required TextEditingController controller,
  required String text,
  double hight = 23,
  double padding = 10,
  Color color = Colors.white,
}) {
  return SizedBox(
    width: width,
    child: TextFormField(
      obscureText: pass,
      maxLines: maxLines,
      maxLength: length == true ? 250 : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '* يرجي اكمال البيانات';
        }
        return null;
      },
      controller: controller,
      style: const TextStyle(fontSize: 16),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: padding,
          ),
          filled: backgroundAnable,
          fillColor: color,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: color,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: color,
            ),
          ),
          hintText: text,
          hintStyle: const TextStyle(fontSize: 13)),
      textAlign: rtl == true ? TextAlign.end : TextAlign.start,
    ),
  );
}
