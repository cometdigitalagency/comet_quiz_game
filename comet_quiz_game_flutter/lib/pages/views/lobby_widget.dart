import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/user_avatar_widget.dart';
import 'package:flutter/material.dart';

class LobbyView extends StatelessWidget {
  final String roomName;
  final List<Player> players;
  final void Function()? onPressed;
  const LobbyView({
    super.key,
    required this.roomName,
    required this.players, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final amountPlayers = players.length;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 48,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Comet Game Room",
                style: TextStyle(
                    color: Color(0xFF792DF2),
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Participant${amountPlayers > 1 ? 's' : ''} ($amountPlayers)",
                  style: const TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 320,
                width: 450,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ListView.builder(
                  itemCount: amountPlayers,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return UserAvatarWidget(
                      index: index + 1,
                      username: player.username,
                      spaceBottom: 32,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(400, 60),
              backgroundColor: const Color(0xFf782CF1),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
              alignment: Alignment.center),
          child: const Text("Start"),
        ),
      ],
    );
  }
}
