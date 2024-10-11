import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTitle extends StatelessWidget {
  UserTitle({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 30, right: 25, left: 25),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xff6C63FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
             SvgPicture.asset(
              
              "assets/images/1.svg",
              height: 70,
              width: 70,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(text,
                  style: GoogleFonts.poppins(
                      color: Color(0xffffffff),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
