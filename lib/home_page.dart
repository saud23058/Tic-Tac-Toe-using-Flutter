import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onturn = true; // The First player is O
  List<String> displayox = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int oscore=0;
  int xscore=0;
  int filledBoxes=0;
  var bgameFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3,),
  );
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
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                          children: [
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                 Text('Player X',style: wgameFont),
                Text(oscore.toString(),style: wgameFont),
              ],
            ),
            const SizedBox(width: 40,),
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                 Text('Player O',style:wgameFont),
                Text(xscore.toString(),style: wgameFont),
              ],
            ),
                          ],
                        ),
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _onTap(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade700)),
                        child: Center(
                            child: Text(
                              displayox[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            )),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(child: Container(
            child: Column(
              children: [
                Text('TIC TAC TOE',style: wgameFont,),

              ],
            ),
          )),

        ],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      if (onturn && displayox[index]=='') {
        displayox[index] = 'O';
        filledBoxes+=1;
      } else if(!onturn&&displayox[index]=='') {
        displayox[index] = 'X';
        filledBoxes+=1;
      }

      onturn = !onturn;
      checkWinner();
    });
  }

  void checkWinner() {
    if (displayox[0] == displayox[1] &&
        displayox[0] == displayox[2] &&
        displayox[0] != '') {
      showWinDialog(displayox[0]);
    }
    else if (displayox[3] == displayox[4] && displayox[3] == displayox[4] &&
        displayox[3] != '') {
      showWinDialog(displayox[3]);
    } else if (displayox[6] == displayox[7] && displayox[6] == displayox[8] &&
        displayox[6] != '') {
      showWinDialog(displayox[6]);
    }
    else if (displayox[0] == displayox[3] && displayox[0] == displayox[6] &&
        displayox[0] != '') {
      showWinDialog(displayox[0]);
    } else if (displayox[1] == displayox[4] && displayox[1] == displayox[7] &&
        displayox[1] != '') {
      showWinDialog(displayox[1]);
    }
    else if (displayox[2] == displayox[5] && displayox[2] == displayox[8] &&
        displayox[8] != '') {
      showWinDialog(displayox[2]);
    }
    else if (displayox[0] == displayox[4] && displayox[0] == displayox[8] &&
        displayox[0] != '') {
      showWinDialog(displayox[0]);
    }else if (displayox[2] == displayox[4] && displayox[2] == displayox[6] &&
        displayox[2] != '') {
      showWinDialog(displayox[2]);
    }

    else if(filledBoxes==9){
      showDrawDialog();
    }
  }

  void showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('Game Draw'),
            actions: [
              TextButton(onPressed:(){
                clearBoard();
                Navigator.of(context).pop();
              }, child: const Text('Play again'))
            ],
          );
        }
    );

  }



  void showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
      return AlertDialog(
        title: Text('Winner is '+winner),
        actions: [
          TextButton(onPressed:(){
            clearBoard();
            Navigator.of(context).pop();
          }, child: const Text('Play again'))
        ],
      );
        }
    );
    if(winner=='O'){
      oscore +=1;
    }else if(winner =='X'){
      xscore+=1;
    }
  }

  void clearBoard(){
setState(() {
  for(int i=0; i<9; i++){
    displayox[i]='';
  }

});
filledBoxes=0;
  }

}
