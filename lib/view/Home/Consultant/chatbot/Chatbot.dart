import 'package:app_final/view/Home/Consultant/chatbot/Messages.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';

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
  late DialogFlowtter dialogFlowtter;
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);

    menuItems = [
      ItemModel('clear chat', () {
        print("object");
        // Navigator.pop(context);
      }, Icons.highlight_remove_rounded),
      ItemModel('Export chat', () {
        Navigator.pop(context);
      }, Icons.import_export_outlined),
      ItemModel('End session', () {
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
                          item.ontap;
                          Navigator.pop(context);
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
                                    child: Text(item.title,
                                        style: mediumStyle),
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
          Expanded(child: MessagesScreen(messages: messages)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type a message to boba...',
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        controller: controller,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColor.greenDark,
                      child: IconButton(
                          icon: Icon(
                            Icons.send_outlined,
                            color: AppColor.white,
                          ),
                          // iconSize: 25,

                          onPressed: (){
                            sendMessage(controller.text);
                            controller.clear();
                          }),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}

class ItemModel {
  String title;
  IconData icon;
  Function ontap;

  ItemModel(this.title, this.ontap, this.icon);
}
