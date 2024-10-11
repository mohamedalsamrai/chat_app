import 'package:chat_app/models/Messages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chatboubl extends StatelessWidget {
  Chatboubl({super.key, required this.messages});
  var radius = Radius.circular(30);
  String messages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xff6C63FF),
            borderRadius: BorderRadius.only(
                topLeft: radius, topRight: radius, bottomRight: radius)),
        child: Text(
          messages,
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
