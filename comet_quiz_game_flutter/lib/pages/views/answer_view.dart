import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:comet_quiz_game_flutter/pages/views/score_board_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/answer_button_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/close_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnswerView extends StatefulWidget {
  final int amountPlayer;
  final String questionLabel;
  final Question question;
  final int closeIn;
  final bool showAnswer;
  final ListAnswerResponse? listAnswerResponse;
  final void Function(Answer)? onAnswer;
  const AnswerView({
    super.key,
    required this.amountPlayer,
    required this.questionLabel,
    required this.question,
    required this.closeIn,
    required this.showAnswer,
    this.onAnswer,
    this.listAnswerResponse,
  });

  @override
  State<AnswerView> createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
  int? selectedAt;
  @override
  Widget build(BuildContext context) {
    double anwerWidth = MediaQuery.of(context).size.width * .8;

    return BackgroundWidget(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: HeaderWidget(
                  amountPlayer: widget.amountPlayer,
                  questionLabel: widget.questionLabel,
                  answerMode: true,
                  title: widget.question.text),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: SizedBox(
                width: anwerWidth,
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 500 ? 2 : 1,
                    children: List.generate(
                        widget.question.answers?.length ?? 0, (index) {
                      final answer = widget.question.answers?[index];
                      final answerAmount = widget.listAnswerResponse?.answers
                              .where(
                                (element) => element.answerId == answer?.id,
                              )
                              .firstOrNull
                              ?.amount ??
                          0;
                      return AnswerButtonWidget(
                        index: index,
                        answer: answer,
                        showAnswer: widget.showAnswer,
                        answerRate: answerAmount / widget.amountPlayer,
                        isSelected: selectedAt == index,
                        onTap: widget.onAnswer == null
                            ? null
                            : (answer) {
                                if (selectedAt == null) {
                                  widget.onAnswer!(answer);
                                  setState(() {
                                    selectedAt = index;
                                  });
                                }
                              },
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            CloseWidget(closeIn: widget.closeIn),
            const SizedBox(
              height: 16,
            ),
          ],
        )
      ],
    );
  }
}
