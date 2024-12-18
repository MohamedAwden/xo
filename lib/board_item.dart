import 'package:flutter/material.dart';

class BoardItem extends StatelessWidget {
  String text;
  void Function(int) ontap;
  int inex;
  BoardItem({required this.inex,super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ontap(inex);},
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w900,
            color: text == 'X' ? Color(0xffF54D62): Color(0xff87E43A),
          ),
        ),
      ),
    );
  }
}
