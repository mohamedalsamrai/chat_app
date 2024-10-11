import 'package:chat_app/Services/chat_service.dart';
import 'package:chat_app/Services/login_services.dart';
import 'package:chat_app/components/ChatBoubl.dart';
import 'package:chat_app/components/ChatBoublF.dart';
import 'package:chat_app/components/TextFieldInput.dart';
import 'package:chat_app/models/Messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatefulWidget {
  Chatpage({super.key, required this.receiverEmail, required this.receiverId});
  static String id = "chat";
  final String receiverEmail;
  final String receiverId;

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  String m = "";
  TextEditingController controller = TextEditingController();
  final ChatService chatService = ChatService();
  final LoginServices loginServices = LoginServices();
  final ScrollController _scrollController = ScrollController(); // ScrollController

  void sendMessag() async {
    if (controller.text.isNotEmpty) {
      await chatService.sendMessage(widget.receiverId, controller.text);
      controller.clear();
      _scrollToBottom(); // تمرير تلقائي للأسفل عند الإرسال
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffffffff)),
        backgroundColor: Color(0xff6C63FF),
        title: Text(widget.receiverEmail,
            style: GoogleFonts.poppins(
                color: Color(0xffffffff),
                fontSize: 17,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(child: buildMesslist()),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: controller,
                onSubmitted: (value) {
                  if (value != "") {
                    sendMessag();
                  }
                },
                decoration: InputDecoration(
                  suffixIconColor: Color(0xff6C63FF),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (controller.text != "") {
                          m = controller.text;
                          sendMessag();
                        }
                      },
                      icon: Icon(Icons.send)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(112, 107, 99, 255), width: 1.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(112, 107, 99, 255), width: 1.3),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildMesslist() {
    String sendId = loginServices.getCurentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(widget.receiverId, sendId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading...");
        }

        // التمرير للأسفل عند استلام رسائل جديدة
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

        return ListView(
          controller: _scrollController, // استخدام ScrollController
          children: snapshot.data!.docs
              .map((doc) => buildMessItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget buildMessItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data["senderId"] == loginServices.getCurentUser()!.email;
    return isCurrentUser
        ? Chatboubl(messages: data["messages"])
        : ChatboublF(messages: data["messages"]);
  }
}
