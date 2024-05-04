import 'package:flutter/material.dart';
import 'package:four_pics_word/pages/hive_repository.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  HiveRepository hiveRepository=HiveRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
       // child: Center(child: Text("${hiveRepository.getInformation()}", style: TextStyle(fontSize: 28,color: Colors.red, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
