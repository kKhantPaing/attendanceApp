import 'package:flutter/material.dart';

Widget CheckInOutWidget(String time, String cio) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        cio,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
    ],
  );
}
