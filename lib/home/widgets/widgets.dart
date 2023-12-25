import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget explainer(Color color, String type, double percentage) {
  return Row(
    children: [
      Container(
        height: 10.h,
        width: 12.w,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15.r)),
      ),
      SizedBox(
        width: 3.w,
      ),
      Text(
        type,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      SizedBox(
        width: 3.w,
      ),
      Text(
        '${percentage.toInt()}%',
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ],
  );
}

Widget textField(
  TextEditingController controller,
  String hintText,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    child: TextField(
      maxLength: 2,
      style: TextStyle(color: Colors.white),
      onChanged: (value) {
        controller.text = value;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),
  );
}
