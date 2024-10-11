import 'package:chat_app/models/Messages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatboublF extends StatelessWidget {
  ChatboublF({super.key,required this.messages});
  var radius = Radius.circular(30);
   String messages;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(162, 107, 99, 255),
            borderRadius: BorderRadius.only(
                topLeft: radius, topRight: radius, bottomLeft: radius)),
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