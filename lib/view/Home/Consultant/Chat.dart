import 'package:app_final/core/components/button_registration.dart';
import 'package:app_final/core/resource/navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/style/my_style.dart';
import 'chatbot/Chatboy.dart';

class ConsultantChat extends StatefulWidget {
  const ConsultantChat({Key? key}) : super(key: key);

  @override
  State<ConsultantChat> createState() => _ConsultantChatState();
}

class _ConsultantChatState extends State<ConsultantChat> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bobo',
                  style: labelStyle2,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 28,
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset("assets/images/chat.png", height: 250),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome, User',
              style: labelStyle2,
            ),
            Text(
              'Let’s start a conversation with Bobo',
              style: mediumStyle,
            ),
            ButtonSign(
                text: "Start",
                width: MediaQuery.of(context).size.width / 1.9,
                ontap: () {
                  navigateTo(context, ChatBot());
                })
          ],
        ),
      ),
    );
  }
}
