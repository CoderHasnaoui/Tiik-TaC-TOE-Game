import 'package:flutter/material.dart';

class HomeGame extends StatefulWidget {
  const HomeGame({super.key});

  @override
  State<HomeGame> createState() => _HomeGameState();
}

class _HomeGameState extends State<HomeGame> {
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  int clickNumber = 0;
  bool isPlayerX = true;
  int moveCount = 0;
  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  // static var myNewFont = GoogleFonts.pressStart2p(
  //     // this font using for gaming
  //     textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
   var myNewFontWhite = const TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 15,
      fontFamily: 'Press Start 2P');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Player X",
                      style: myNewFontWhite,
                    ),
                    Text(
                      exScore.toString(),
                      style: myNewFontWhite,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Player O",
                      style: myNewFontWhite,
                    ),
                    Text(
                      ohScore.toString(),
                      style: myNewFontWhite,
                    )
                  ],
                ),
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, index) => GestureDetector(
                        onTap: () => _tapped(index),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[700]!),
                          ),
                          child: Center(
                            child: Text(
                              board[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                          ),
                        ),
                      )),
            ),
          ),
          Expanded(
              child: Center(
            child: Column(
              children: [
                Text(
                  "TIC TAC TOE",
                  style: myNewFontWhite,
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "@CREATED BY HASNAOUI",
                  style: myNewFontWhite,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _tapped(index) {
    if (board[index].isNotEmpty) return;
    setState(() {
      // incrrese number click
      // clickNumber++;
      board[index] = isPlayerX ? 'x' : 'o';
      moveCount++;

      // check for equaliter Lines
      if (_checkWinner(index)) {
        _showDialog('Player ${board[index]} wins!');
      } else if (moveCount == 9) {
        _showDialog('The game is a draw!');
      } else {
        isPlayerX = !isPlayerX;
      }
    });
  }

  bool _checkWinner(int index) {
    final List<List<int>> winningLines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    return winningLines.any((line) =>
        line.contains(index) &&
        board[line[0]] == board[line[1]] &&
        board[line[1]] == board[line[2]] &&
        board[line[0]].isNotEmpty);
  }

  void _showDialog(String content) {
    String XO = content.split(" ")[1];
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                setState(() {
                  board = List.filled(9, '');
                  isPlayerX = true;
                  moveCount = 0;
                  XO == 'x'
                      ? exScore++
                      : (XO == 'o' ? ohScore++ : "");
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
