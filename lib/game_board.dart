import 'package:flutter/material.dart';
import 'package:xogame/board_item.dart';

class GameBoard extends StatefulWidget {
  GameBoard({super.key});

  static const String routeName = 'get_board';

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> text = List.filled(9, '');
  late String player1Symbol ;
  late String player2Symbol = player1Symbol == 'X' ? "O" : 'X';
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    player1Symbol=   ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff00D2FF),
              Color(0xff3A7BD5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${player1Symbol}: $player1Score',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      '${player2Symbol}: $player2Score',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "${round.isOdd ? player1Symbol.toUpperCase() : player2Symbol.toUpperCase()}'s Turn",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Colors.white),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * .75,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(44),
              ),
              clipBehavior: Clip.antiAlias,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: MediaQuery.sizeOf(context).height * .25,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (_, index) => BoardItem(
                  text: text[index],
                  ontap: onItemCliked,
                  inex: index,
                ),
                itemCount: text.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  int round = 1;

  void onItemCliked(int index) {
    if (text[index].isNotEmpty) return;
    if (round.isOdd) {
      text[index] = player1Symbol;
      if (checkWinner(player1Symbol)) {
        player1Score++;
        clearBoard();
        return;
      }
    } else {
      text[index] = player2Symbol;
      if (checkWinner(player2Symbol)) {
        player2Score++;
        clearBoard();
        return;
      }
    }
    round++;
    if (round == 10) {
      clearBoard();
      return;
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (round < 5) return false;

    if (text[0] == symbol && text[4] == symbol && text[8] == symbol) {
      return true;
    }
    if (text[2] == symbol && text[4] == symbol && text[6] == symbol) {
      return true;
    }
    for (int i = 0; i < 6; i += 3) {
      if (text[i] == symbol && text[i + 1] == symbol && text[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 2; i++) {
      if (text[i] == symbol && text[i + 3] == symbol && text[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }

  void clearBoard() {
    text = List.filled(9, '');
    round = 1;
    setState(() {});
  }
}
