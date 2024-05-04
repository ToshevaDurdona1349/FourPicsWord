import 'package:flutter/material.dart';
import 'package:four_pics_word/buttons/customButon.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.only(top: 250),
        child: Container(
          height: 250,
          child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              CustomButton(buttonName: "Play game",route:'/playgame'),
              CustomButton(buttonName: "Settings",route: '/settings'),
              CustomButton(buttonName: "About",route: '/about'),
            ],),
          ),
        ),
      )
    );
  }
}
