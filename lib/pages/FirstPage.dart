import 'package:chat_app/pages/LoginPage.dart';
import 'package:chat_app/pages/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size ksize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: ksize.height*0.03,),
          SizedBox(
            height: ksize.height * 0.3,
            child: SvgPicture.asset("assets/images/home.svg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: ksize.height * 0.085,
                ),
                Text(
                  "Hello",
                  style: GoogleFonts.poppins(
                      color: Color(0xff292929),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Welcome To Chat App, where\nyou can chatting with evryone",
                  style: GoogleFonts.poppins(
                      color: Color(0xff878787),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: ksize.height * 0.06,
                ),
                Container(
                  height: 55,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Color(0xff6C63FF),
                      borderRadius: BorderRadius.circular(25)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    },
                    child: Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            color: Color(0xffffffff),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ksize.height * 0.03,
                ),
                Container(
                  height: 55,
                  width: 280,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.3, color: Color(0xff6C63FF)),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(25)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            color: Color(0xff6C63FF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ksize.height * 0.06,
                ),
             
                
           
              ],
            ),
          )
        ],
      )),
    );
  }
}
