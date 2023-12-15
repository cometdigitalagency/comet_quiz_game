import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/header_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/user_avatar_widget.dart';
import 'package:flutter/material.dart';

class ScoreBoardView extends StatelessWidget {
  final List<PlayerScore> players;
  const ScoreBoardView({
    super.key,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    final amountPlayer = players.length;
    return BackgroundWidget(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                child: HeaderWidget(
                  answerMode: true,
                  questionLabel: "Comet Game Room",
                  title: "Leaderboard",
                  amountPlayer: amountPlayer,
                ),
              ),
              // list of users
              Container(
                height: 200,
                width: 600,
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ListView.builder(
                  itemCount: amountPlayer,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: UserAvatarWidget(
                            index: index + 1,
                            username: player.username,
                            spaceBottom: 24,
                            textColor: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF52F86),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Text(
                            "${player.score}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // space
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // backend
        Container(
          color: const Color(0xFF35126C),
        ),
        ...children,
      ],
    );
  }
}
