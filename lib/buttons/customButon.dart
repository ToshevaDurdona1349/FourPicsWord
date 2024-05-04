import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final String route;

  const CustomButton({required this.buttonName, required this.route});

  @override
  Widget build(BuildContext context) {
    return Material(

      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, route);

        },
        child: Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFDFF3BE),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black26)]
          ),
          child:Center(
            child: Text(buttonName,style: TextStyle(color: Colors.blue, fontSize: 20),)
          )
        ),
      ),
    );
  }
}
