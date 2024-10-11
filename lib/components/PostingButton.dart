import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostingButton extends StatelessWidget {
  PostingButton({super.key, required this.buttonName,required this.onTap});
  VoidCallback onTap;
  String buttonName;
  //Widget page;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff6C63FF), borderRadius: BorderRadius.circular(25)),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Center(
          child: Text(
            buttonName,
            style: GoogleFonts.poppins(
                color: Color(0xffffffff),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
