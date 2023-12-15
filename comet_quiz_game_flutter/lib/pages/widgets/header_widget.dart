import 'package:comet_quiz_game_flutter/gen/assets.gen.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/section_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String questionLabel;
  final String title;
  final int amountPlayer;
  final bool answerMode;

  const HeaderWidget({
    super.key,
    required this.amountPlayer,
    required this.questionLabel,
    required this.title,
    required this.answerMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SectionWidget(
              questionLabel: questionLabel,
              size: 60,
            ),
            answerMode
                ? const Spacer()
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TitleWidget(title: title, textSize: 28),
                    ),
                  ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF52F86),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Assets.images.users.svg(
                    width: 38,
                    height: 38,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "$amountPlayer",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        TitleWidget(title: title, textSize: 28),
      ],
    );
  }
}
