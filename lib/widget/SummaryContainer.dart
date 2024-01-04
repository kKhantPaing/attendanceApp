import 'package:flutter/material.dart';

class SummaryContainer extends StatefulWidget {
  const SummaryContainer({
    Key? key,
    required this.label,
    required this.count,
    required this.color,
  }) : super(key: key);

  final String label, count;
  final Color color;

  @override
  State<SummaryContainer> createState() => _SummaryContainerState();
}

class _SummaryContainerState extends State<SummaryContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                widget.count,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
