import 'package:app_final/core/style/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/my_style.dart';

class MessagesScreen extends StatefulWidget {
  final  messages;

  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      // reverse: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 0 : 20),
                          topLeft: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 20 : 0),
                        ),
                        color: widget.messages[index]['isUserMessage']
                            ? AppColor.greenDark
                            : Color(0xffdfdfdf)),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child: Text(
                      widget.messages[index]['message'].text.text[0],
                      style: mediumStyle.apply(
                        color: widget.messages[index]['isUserMessage']
                            ? AppColor.white
                            : AppColor.black,
                      ),
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
