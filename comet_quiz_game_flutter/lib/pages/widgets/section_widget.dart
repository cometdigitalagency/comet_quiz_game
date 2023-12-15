import 'package:comet_quiz_game_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.questionLabel,
    required this.size,
  });

  final String questionLabel;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.images.question.svg(
          width: size,
          height: size,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          questionLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
