import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toi/home_page.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var wgameFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 18, // Adjust the font size as per your requirement
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('TIC TAC TOE',style: wgameFont)),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'PLAY GAME',
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: Colors.black, // Changed text color to black for better contrast
                        letterSpacing: 3,
                        fontSize: 20, // Increased font size to 20 for better visibility
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
