import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:comet_quiz_game_flutter/pages/join_room_page.dart';
import 'package:comet_quiz_game_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Serverpod Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Axiforma"),
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
          widget,
          maxWidth: double.infinity,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.resize(1920, name: DESKTOP),
            ResponsiveBreakpoint.resize(double.infinity, name: '4K'),
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const JoinRoomPage(),
          ),
          GoRoute(
            path: '/room/:roomId',
            builder: (context, state) {
              return MainPage(
                roomId: int.parse(state.pathParameters['roomId']!),
              );
            },
          )
        ],
      ),
    );
  }
}
