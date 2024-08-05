
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static const String playerX = "X";
  static const String playerY = "O";

  late String currentPlayer;
  late bool gameEnd;
  late List<String> occupied;

  @override
  void initState() {
    initializeGame();
    super.initState();
  }

  void initializeGame() {
    currentPlayer = playerX;
    gameEnd = false;
    occupied = ["", "", "", "", "", "", "", "", ""];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
          "$currentPlayer turn",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
             Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.height / 2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (context, int index) {
            return _box(index);
          }),
    ),
    const SizedBox(height: 100),
            ElevatedButton(
                    onPressed: () {
            setState(() {
              initializeGame();
            });
                    },
                    style: ElevatedButton.styleFrom(
            side:const BorderSide(color: Colors.white,
            width: 1.5),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ), elevation: 1),
                  
                  child: const Padding(
            padding: EdgeInsets.all(16),
             child: Text(
              "Play Again",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            )
            ),
          ],
          ),        
        ),
        );  }

  Widget _box(int index) {
    return InkWell(
      onTap: () {
        if (gameEnd || occupied[index].isNotEmpty) {
          return;
        }

        setState(() {
          occupied[index] = currentPlayer;
          changeTurn();
          checkForWinner();
          checkForDraw();
        });
      },
       child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
        color: occupied[index].isEmpty
          ? Colors.grey.withOpacity(0.5)
          : occupied[index] == playerX
            ? Colors.blue.withOpacity(0.5)
            : Colors.red.withOpacity(0.5),
          border: Border.all(
            color: occupied[index] == playerX 
            ? Colors.blue 
            : (occupied[index].isEmpty ? Colors.grey : Colors.red),
            width: 2
          ),
        ),
        child: Center(
          child: Text(
            occupied[index],
            style: TextStyle(fontSize: 38,
            color: occupied[index] == playerX
             ? Colors.blue 
             : Colors.red,),
          ), 
        ),
      ),
    );
  }


  changeTurn() {
    if (currentPlayer == playerX) {
      currentPlayer = playerY;
    } else {
      currentPlayer = playerX;
    }
  }

  checkForWinner() {
    //Define winning positions
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningPos in winningList) {
      String playerPosition0 = occupied[winningPos[0]];
      String playerPosition1 = occupied[winningPos[1]];
      String playerPosition2 = occupied[winningPos[2]];

      if (playerPosition0.isNotEmpty) {
        if (playerPosition0 == playerPosition1 &&
            playerPosition0 == playerPosition2) {
          //all equal means player won
          showGameOverMessage("Player $playerPosition0 Won");
          gameEnd = true;
          return;
        }
      }
    }
  }

  checkForDraw() {
    if (gameEnd) {
      return;
    }
    bool draw = true;
    for (var occupiedPlayer in occupied) {
      if (occupiedPlayer.isEmpty) {
        //at least one is empty not all are filled
        draw = false;
      }
    }

    if (draw) {
      showGameOverMessage("Draw");
      gameEnd = true;
    }
  }

  showGameOverMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            "Game Over \n $message",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          )),
    );
  }
}