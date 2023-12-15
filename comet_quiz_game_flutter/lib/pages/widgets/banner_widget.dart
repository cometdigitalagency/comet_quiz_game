import 'package:comet_quiz_game_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 371,
          color: const Color.fromRGBO(23, 6, 63, 1),
        ),
        Positioned(
          top: -120,
          right: -150,
          child: Assets.images.comet.svg(width: 300),
        ),
        Positioned(
          top: -100,
          left: -70,
          child: Assets.images.dust.svg(width: 250),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Assets.images.cometLogo.svg(width: 100),
                    Positioned(
                      top: -100,
                      left: -150,
                      child: Assets.images.start.svg(width: 150),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Text(
                      "A place where",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      right: -80,
                      top: -40,
                      child: Assets.images.startV2.svg(width: 56),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Text(
                      "code meets creativity",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      right: -100,
                      bottom: -20,
                      child: Assets.images.line.svg(width: 64),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Text.rich(
                      TextSpan(children: [
                        TextSpan(text: "Your Trusted "),
                        TextSpan(
                            text: "App Development",
                            style: TextStyle(
                                color: Color.fromRGBO(233, 70, 126, 1))),
                        TextSpan(text: " Partner.")
                      ]),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w100),
                    ),
                    Positioned(
                      bottom: 0,
                      left: -150,
                      child: Assets.images.yellowStart.svg(width: 40),
                    ),
                    Positioned(
                      right: -50,
                      child: Assets.images.cursor.svg(width: 56),
                    ),
                    Positioned(
                      bottom: -100,
                      left: -80,
                      child: Assets.images.fire.svg(width: 72),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
