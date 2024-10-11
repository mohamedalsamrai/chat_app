import 'package:chat_app/Services/signUp_service.dart';
import 'package:chat_app/components/PostingButton.dart';
import 'package:chat_app/components/TextFieldInput.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/pages/Home_Page.dart';
import 'package:chat_app/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLod = false;

  @override
  Widget build(BuildContext context) {
    Size ksize = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLod,
      child: Scaffold(
        backgroundColor: Color(0xfffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xfffffffff),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: ksize.height * 0.27,
                child: SvgPicture.asset("assets/images/SignUpPage.svg"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  children: [
                    SizedBox(
                      height: ksize.height * 0.06,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "   Sign Up",
                        style: GoogleFonts.poppins(
                            color: Color(0xff6C63FF),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: ksize.height * 0.03,
                    ),
                    TextFieldInput(
                      onChanged: (v) {
                        email = v;
                      },
                      hintText: "Email",
                      ispass: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldInput(
                      onChanged: (v) {
                        password = v;
                      },
                      hintText: "Password",
                      ispass: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PostingButton(
                      buttonName: "Sign up",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLod = true;
                          setState(() {});
                          try {
                            await SignupService().signUpUser(email!, password!);
                            Navigator.pushReplacementNamed(context, HomePage.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("email is login "),
                                backgroundColor: Color(0xff6C63FF),
                              ));
                            }
                          } catch (e) {
                            print(e);
                          }
                          isLod = false;
                          setState(() {});
                        }
                      },
                    ),
                      SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "do you have an account?",
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginpage()));
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff6C63FF),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  
                   
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
