import 'package:comet_quiz_game_flutter/pages/widgets/close_widget.dart';
import 'package:comet_quiz_game_flutter/pages/views/score_board_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/section_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  final String label;
  final String question;
  final int closeIn;
  const QuestionView({
    super.key,
    required this.label,
    required this.question,
    required this.closeIn,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SectionWidget(
                questionLabel: label,
                size: 150,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TitleWidget(
                  title: question,
                  textSize: 48,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CloseWidget(
                closeIn: closeIn,
              )
            ],
          ),
        ),
      ],
    );
  }
}
