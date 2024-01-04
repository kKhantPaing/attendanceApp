import 'package:flutter/material.dart';

Widget checkInOutWidget(String time, String cio) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        cio,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        time,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    ],
  );
}
