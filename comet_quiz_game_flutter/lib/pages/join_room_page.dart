import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:comet_quiz_game_flutter/constants/local_storage_key.dart';
import 'package:comet_quiz_game_flutter/main.dart';
import 'package:comet_quiz_game_flutter/utils/app_alert.dart';
import 'package:comet_quiz_game_flutter/utils/local_storage.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/app_text_field_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/banner_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/quiz_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({super.key});

  @override
  State<JoinRoomPage> createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  int? roomId;

  // to save user to local storage and naviage to main page.
  Future<void> onJoin() async {
    try {
      final player = await client.main.createPlayer(username!);
      final sharePreference = await SharedPreferences.getInstance();
      final localStorage = LocalStorage(sharedPreferences: sharePreference);
      await localStorage.saveObject(LocalStorageKey.user.name, player);
      if (mounted && roomId != null) {
        context.go("/room/$roomId");
      } else {
        AppAlert.showAppToast("Something went wrong!");
      }
    } on AppException catch (e) {
      AppAlert.showAppToast(e.message);
    } catch (e) {
      AppAlert.showAppToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuizAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // banner
            const BannerWidget(),
            const SizedBox(
              height: 24,
            ),
            // username
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Add TextFormFields and ElevatedButton here.
                    AppTextFieldWidget(
                      hintText: "Eg. John Smith",
                      onSaved: (data) {
                        username = data;
                      },
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Join game room",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextFieldWidget(
                      hintText: "Eg. 241",
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onSaved: (data) {
                        roomId = int.tryParse(data!);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            // room ID
            // join button
            OutlinedButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() == true) {
                  _formKey.currentState?.save();
                  await onJoin();
                }
              },
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(
                    color: Color(0xFF792DF2),
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
                side: const BorderSide(
                  color: Color(0xFF782CF1),
                  width: 1,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text("Join"),
            ),

            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
