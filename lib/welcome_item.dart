import 'package:flutter/material.dart';

import 'game_board.dart';

class WelcomeItem extends StatelessWidget {
  String symbol;

  WelcomeItem({super.key, required this.symbol});

  @override
  Widget build(BuildContext consymbol) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.of(consymbol).pushNamed(GameBoard.routeName,
          arguments: symbol,
          );
        },
        child: Container(
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              symbol,
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w900,
                color: symbol == 'X' ? Color(0xffF54D62) : Color(0xff87E43A),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
