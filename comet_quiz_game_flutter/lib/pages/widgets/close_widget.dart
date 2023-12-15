import 'package:flutter/material.dart';

class CloseWidget extends StatelessWidget {
  const CloseWidget({
    super.key,
    required this.closeIn,
  });

  final int closeIn;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Close in ${closeIn}s",
      style: const TextStyle(
        color: Color(0xFFF52F86),
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }
}
