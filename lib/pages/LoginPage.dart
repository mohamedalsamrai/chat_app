import 'package:chat_app/Services/login_services.dart';
import 'package:chat_app/components/PostingButton.dart';
import 'package:chat_app/components/TextFieldInput.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/pages/Home_Page.dart';
import 'package:chat_app/pages/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isLod = false;
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

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
                height: ksize.height * 0.3,
                child: SvgPicture.asset("assets/images/loginpage.svg"),
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
                        "   Login",
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
                      ispass: false,
                      onChanged: (v) {
                        email = v;
                      },
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldInput(
                      ispass: true,
                      onChanged: (v) {
                        password = v;
                      },
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PostingButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLod = true;
                          setState(() {});
                          try {
                            await LoginServices().loginUser(email!,password!);
                              Navigator.pushReplacementNamed(
                                context, HomePage.id);
                            // Navigator.pushReplacementNamed(
                            //     context, Chatpage.id,arguments: email);
                          } on FirebaseAuthException catch (e) {
                            print(e.code);
                            if (e.code == "invalid-credential") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No user found for that email "),
                                backgroundColor: Color(0xff6C63FF),
                              ));
                            } else if (e.code == "wrong-password") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Wrong password"),
                                backgroundColor: Color(0xff6C63FF),
                              ));
                            }
                          }
                          isLod = false;
                          setState(() {});
                        }
                      },
                      buttonName: "Login",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account",
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
                                      builder: (context) => SignUpPage()));
                            },
                            child: Text(
                              "Sign Up",
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
