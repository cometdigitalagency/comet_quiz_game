import 'dart:math';

import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final List<Color> _colors = const [
    Color(0xFF792DF2),
    Color(0xFFF52F86),
    Color(0xFFFF8D1A),
    Color(0xFF00A384),
    Color(0xFF048EFF),
  ];
  final int index;
  final String username;
  final double spaceBottom;
  final Color? textColor;
  const UserAvatarWidget({
    super.key,
    required this.index,
    required this.username,
    required this.spaceBottom,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final textAvatar = username.characters.firstOrNull?.toUpperCase() ?? "";
    return Padding(
      padding: EdgeInsets.only(bottom: spaceBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            child: Text(
              "$index",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: _colors[Random().nextInt(5)],
            child: Text(
              textAvatar,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: textColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
