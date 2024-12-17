import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podomoro/screens/auth/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/welcome_screen_background.jpg"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Podomoro", style: GoogleFonts.lifeSavers(fontSize: 64, fontWeight: FontWeight.bold),),

                SizedBox(height: 160,),

                Text(
                  "Start getting things done",
                  style: GoogleFonts.lifeSavers(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),


                SizedBox(
                  width: 210,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                    child: Text(
                      "Get started",
                      style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Color(0xFF483BD4)),

                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: GoogleFonts.roboto(fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Color(0xFF1600FF),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Sign in clicked");
                          },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 60,
                )
              ],
            ),
          )),
    );
  }
}
