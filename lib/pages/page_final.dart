import 'package:flutter/material.dart';

class FinalCloss extends StatelessWidget {
  const FinalCloss({required this.level, required this.maney});

  final int maney;
  final  int level;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.greenAccent,
          child: Column(children: [
            Text(" level: $level",style: TextStyle(fontSize: 22),),
            Text(" level: $maney",style: TextStyle(fontSize: 22),)
          ],),
        ),
      ),
    );
  }
}
