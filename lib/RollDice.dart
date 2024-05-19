import 'dart:math';

import 'package:flutter/material.dart';
//
class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState(){
    return _DiceRollState();
  }
}

Random randomizer = Random();

class _DiceRollState extends State<DiceRoll>{
  int? preRanNum = 1;
  int? ranNum = 1;

  void rollDice() {
    setState((){
      ranNum = randomizer.nextInt(6) + 1;
      while(ranNum == preRanNum){
        ranNum = randomizer.nextInt(6) + 1;
      }
      print("ranNum: $ranNum");
      print("preRanNum: $preRanNum");
      preRanNum = ranNum;
    }); 
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rolling Dice App"),
        backgroundColor: Colors.amber.shade300,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Colors.blueAccent.shade200,
            Colors.deepOrange.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                "assets/images/dice-$ranNum.png",
                width: 200,),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: rollDice, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade100,
                  elevation: 3,
                  textStyle: const TextStyle(
                    fontSize: 28,
                  )
                ),
                child: Text(
                  "Click to roll",
                  style: TextStyle(
                    color: Colors.amber.shade600
                  ),))
            ],
          ),
        ),
      ),
    );
  }
}