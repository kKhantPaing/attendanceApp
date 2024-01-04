import 'package:flutter/material.dart';

class CIOEnqCard extends StatefulWidget {
  const CIOEnqCard({super.key});

  @override
  State<CIOEnqCard> createState() => _CIOEnqCardState();
}

class _CIOEnqCardState extends State<CIOEnqCard> {
  @override
  Widget build(data) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}
