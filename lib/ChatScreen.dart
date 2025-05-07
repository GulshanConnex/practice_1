import 'package:flutter/material.dart';
import 'package:practice/Uihelper/textField_HelperClass.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<_Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_Message(text: text, isSentByMe: true));
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Screen'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (ctx, index) {
                    final message = _messages[_messages.length - 1 - index];
                    return Align(
                      alignment: message.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: message.isSentByMe
                              ? Colors.blue[100]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(message.text),
                      ),
                    );
                  },
                ),
              ),
              // Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Type a message...',
                          labelStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      )),
                    SizedBox(width: 7,),

                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // You can use AppColor.primary if defined
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: _sendMessage,
                        tooltip: 'Send',
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isSentByMe;

  _Message({required this.text, this.isSentByMe = true});
}
