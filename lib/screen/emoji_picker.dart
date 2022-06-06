import 'package:flutter/material.dart';
import 'package:vlogpost/Widget/messageWidget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({Key? key}) : super(key: key);

  @override
  State<EmojiScreen> createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  FocusNode focusNode = FocusNode();
  bool isEmojiVisible = false;
  TextEditingController messagecontroller = TextEditingController();
  final messages = <String>[];
  final message = '';
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isEmojiVisible = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emoji Picker'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              children: messages
                  .map((message) => MessageWidget(message: message))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: messagecontroller,
              minLines: 1,
              focusNode: focusNode,
              maxLines: 4,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: isEmojiVisible
                      ? InkWell(
                          onTap: focusNode.requestFocus,
                          child: const Icon(
                            Icons.keyboard_rounded,
                            color: Colors.purple,
                            size: 25,
                          ))
                      : InkWell(
                          onTap: () {
                            focusNode.unfocus();
                            focusNode.canRequestFocus = false;
                            setState(() {
                              isEmojiVisible = !isEmojiVisible;
                            });
                          },
                          child: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      messages.insert(0, messagecontroller.text);
                    });

                    messagecontroller.clear();
                  },
                  child: const Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 25,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                // prefixIcon: Icon(icon)
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 10,
          ),
          isEmojiVisible
              ? SizedBox(
                  height: 265,
                  child: Offstage(
                    offstage: !isEmojiVisible,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        setState(() {
                          messagecontroller.text =
                              messagecontroller.text + emoji.emoji;
                        });
                      },
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
