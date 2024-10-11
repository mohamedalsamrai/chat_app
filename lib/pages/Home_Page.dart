import 'package:chat_app/Services/chat_service.dart';
import 'package:chat_app/Services/login_services.dart';
import 'package:chat_app/components/User_title.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/pages/FirstPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String id = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatService _chatService = ChatService();
  final LoginServices _loginServices = LoginServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> logout() async {
    return await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logout();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ));
              },
              icon: Icon(Icons.logout))
        ],
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff6C63FF),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loging");
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _loginServices.getCurentUser()!.email) {
      return UserTitle(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Chatpage(
                      receiverEmail: userData["email"],
                      receiverId: userData["uid"])));
        },
      );
    } else {
      return Container();
    }
  }
}
