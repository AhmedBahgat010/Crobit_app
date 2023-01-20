import 'package:flutter/material.dart';

import '../../../../core/style/my_colors.dart';
import '../../../../core/style/my_style.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late List<ItemModel> menuItems;
  CustomPopupMenuController _controller = CustomPopupMenuController();

  @override
  void initState() {
    menuItems = [
      ItemModel('clear chat', (){
        print("object");
        // Navigator.pop(context);
      }, Icons.highlight_remove_rounded ),
      ItemModel('Export chat', (){
        Navigator.pop(context);
      }, Icons.import_export_outlined),
      ItemModel('End session', (){
        Navigator.pop(context);
      }, Icons.output),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text("Bobo"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_sharp, size: 30),
          ),
          CustomPopupMenu(
            child: Icon(Icons.drag_handle, color: AppColor.greenDark, size: 30),
            menuBuilder: () => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(

                decoration: BoxDecoration(
                  color: AppColor.white,

                  borderRadius: BorderRadius.circular(25),
                ),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: menuItems
                        .map(
                          (item) => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              item.ontap;Navigator.pop(context);
                              _controller.hideMenu();
                            },
                            child: Container(
                              height: 60,
                              // width: 150,

                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                // onTap: () {
                                //   item.ontap;
                                // },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      item.icon,
                                      size: 25,
                                      color: AppColor.black,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          item.title,
                                          style: mediumStyle
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            pressType: PressType.singleClick,
            verticalMargin: -10,
            controller: _controller,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .6),
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Color(0xffdfdfdf),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Milk Mazowski",
                                      style: mediumStyle.apply(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(
                                      "admin",
                                      style: mediumStyle.apply(
                                          color: AppColor.green),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "lol",
                                  style: mediumStyle.apply(
                                    color: Colors.black87,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "16:04",
                                    style: mediumStyle.apply(
                                        color: AppColor.greenDark),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .6),
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Color(0xffdfdfdf),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Milk Mazowski",
                                      style: mediumStyle.apply(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "hiiiiiiiiiiiiiiiii",
                                  style: mediumStyle.apply(
                                    color: Colors.black87,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "16:04",
                                    style: mediumStyle.apply(
                                        color: AppColor.greenDark),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * .6),
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      "The sent messages don’t need all of that, just the message and the time is enough. However, it is important to set a different color to the Container in order to differentiate between sent and received messages",
                                      style: mediumStyle.apply(
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "16:04",
                                      style: mediumStyle.apply(
                                          color: AppColor.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Align(alignment: Alignment.bottomCenter, child: _sendMessageArea()),
        ],
      ),
    );
  }
}

_sendMessageArea() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    height: 70,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.emoji_emotions),
          iconSize: 25,
          color: AppColor.greenDark,
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Write a message...',
            ),
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.attach_file,
          ),
          iconSize: 25,
          color: AppColor.gray,
          onPressed: () {},
        ),
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: IconButton(
            icon: Icon(
              Icons.keyboard_voice_sharp,
              color: AppColor.white,
            ),
            // iconSize: 25,

            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

class ItemModel {
  String title;
  IconData icon;
  Function ontap;

  ItemModel(this.title,this.ontap, this.icon);
}
