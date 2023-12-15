import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:flutter/material.dart';

class AnswerButtonWidget extends StatelessWidget {
  const AnswerButtonWidget({
    super.key,
    required this.answer,
    required this.index,
    required this.showAnswer,
    this.onTap,
    required this.answerRate,
    required this.isSelected,
  });

  final void Function(Answer answer)? onTap;
  final Answer? answer;
  final double answerRate;
  final List<Color> colors = const [
    Color(0xFFFF8D1A),
    Color(0xFFF52F86),
    Color(0xFF00A384),
    Color(0xFF048EFF),
  ];

  final Color correct = const Color(0xFF00A384);
  final int index;
  final bool? isSelected;
  final bool showAnswer;

  @override
  Widget build(BuildContext context) {
    Color? avatarBackgroundColor;
    Color? avatarForegroundColor = const Color(0xFF35126C);
    Color cardColor = Colors.white;
    BoxBorder? border;
    if (showAnswer) {
      avatarBackgroundColor = answer?.isCorrectOption == true
          ? correct
          : Colors.white.withOpacity(0.4);
      avatarForegroundColor = answer?.isCorrectOption == true
          ? Colors.white
          : Colors.white.withOpacity(0.4);

      border = answer?.isCorrectOption == true
          ? Border.all(color: correct, width: 4)
          : null;

      cardColor = answer?.isCorrectOption == true
          ? Colors.white
          : Colors.white.withOpacity(0.4);
    } else {
      border = isSelected == true
          ? Border.all(color: const Color(0xFFF52F86), width: 4)
          : null;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: avatarBackgroundColor,
          foregroundColor: avatarForegroundColor,
          radius: 18,
          child: Text(
            "${index + 1}",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (onTap != null && answer != null) {
                onTap!(answer!);
              }
            },
            child: Card(
              color: cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(45),
                  border: border,
                  gradient: LinearGradient(
                    stops: [
                      answerRate, // percentage value 0.5 = 50%
                      0.0,
                    ],
                    colors: [
                      colors[index]
                          .withOpacity(0.3), // the color you need to fill,
                      Colors.white, //container base color
                    ],
                  ),
                ),
                child: Text(
                  answer?.text ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF35126C)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
