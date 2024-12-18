import 'package:flutter/material.dart';
import 'package:xogame/welcome_item.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/welcome';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              Spacer(),
              Text(
                'Pick who goes first?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  WelcomeItem(symbol: 'X',),
                  SizedBox(width: 16,),
                  WelcomeItem(symbol: 'O',),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
