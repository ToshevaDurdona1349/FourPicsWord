import 'package:flutter/material.dart';
import 'package:four_pics_word/pages/aboute.dart';
import 'package:four_pics_word/pages/page1.dart';
import 'package:four_pics_word/pages/play_game.dart';
import 'package:four_pics_word/pages/settings.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("natija");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner:  false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/about':(context)=>About(),
        '/playgame':(context)=>PlayGame(),
        '/settings':(context)=>Settings(),

      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Page1();
  }
}
