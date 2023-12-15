import 'package:comet_quiz_game_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuizAppBar({
    Key? key,
    this.title,
    this.elevation = 2.0,
  }) : super(key: key);
  final Widget? title;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [
              0.0,
              0.1,
              0.5,
              1.0,
            ],
            colors: [
              Color(0XFFFF8D1A),
              Color(0XFFF52F86),
              Color(0XFF792DF2),
              Color(0XFF782CF1),
            ],
          ),
        ),
        child: AppBar(
          centerTitle: true,
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Assets.images.cometLogo.svg(),
          ),
          elevation: 0.0,
          title: title,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Assets.images.innovateTogether.svg(width: 150),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
