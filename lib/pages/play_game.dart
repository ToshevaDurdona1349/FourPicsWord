import 'dart:math';
import 'package:flutter/material.dart';
import 'package:four_pics_word/image_string.dart';
import 'package:four_pics_word/model/result_modal.dart';
import 'package:four_pics_word/pages/hive_repository.dart';
import 'package:four_pics_word/pages/page_final.dart';

import '../model/model.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  ImageString imageString=ImageString();  // rasmlar olish uchun kk
  List<ModelClass> berilganShart=[];  // oyin besh qismdan iborat, rasm va javob sozdan
  List<int> variantlar= [];        // 14 xar xel xarf va javobi bilan qilish uchun sondan foydalanamiz
  Map<int, String> map={};
  int nextPosition=0;     // bu Next bosilganda List<ModelClass> dan element olib beradi
   int? bosilganVariant;
   int level=1;
   int money=10;
   HiveRepository hiveRepository=HiveRepository();




  @override
  void initState() {
    berilganShart.add(ModelClass(imageString.hero, "HERO"));
    berilganShart.add(ModelClass(imageString.ball, "BALL"));
    berilganShart.add(ModelClass(imageString.fish, "FISH"));
    berilganShart.add(ModelClass(imageString.pair, "PAIR"));
    berilganShart.add(ModelClass(imageString.jump, "JAMP"));
    berilganShart.add(ModelClass(imageString.lean, "LEAN"));
    berilganShart.add(ModelClass(imageString.sink, "SINK"));
    berilganShart.add(ModelClass(imageString.date, "DATE"));
    berilganShart.add(ModelClass(imageString.gift, "GIFT"));
    berilganShart.add(ModelClass(imageString.wave, "WAVE"));
    berilganShart.add(ModelClass(imageString.wine, "WINE"));
    func(berilganShart[nextPosition].hideWord);

    super.initState();
  }

  @override
  void dispose() {
   //variantlar.clear();
    super.dispose();
  }

  void func(String s)async{      // bunda s javob string kiritilib Globaldagi Mapni malumot bilan toldiradi
    variantlar.addAll(s.codeUnits.toList());


    for(int i=0; variantlar.length<14; i++){
      int p=Random().nextInt(90-65)+65;
      if(variantlar.contains(p)){
      }
      else variantlar.add(p);
    }
    variantlar.shuffle();
    print(variantlar);
    for(int i=0; i<variantlar.length; i++){
      map[i]=String.fromCharCode(variantlar.elementAt(i));}
    variantlar.clear();

  }


  List<String> answer=["","","",""];// bu turtalik listga ega javob
  List<int> anwer_Map_indexes=[];

  @override
  Widget build(BuildContext context) {
    print("answer:${answer}");
    print("answer:${anwer_Map_indexes}");
    int bitta=0;

    //variantlar.addAll(berilganShart[0].hideWord.split(""));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("level $level"),
              MaterialButton(onPressed: (){
                setState(() {
                  Navigator.of(context).pushNamed('/playgame');
                });
              },
                child: Text("Restart"),
                color: Colors.greenAccent,
                shape: Border.all(style: BorderStyle.solid),
              ),
              Text("$money")
            ],
          ),   // birinchi qator
          Container(
            child: Image.asset(berilganShart[nextPosition].assetsAdress,width: 250,fit: BoxFit.cover,),
          ),// ikkinchi qator rasm
          Container(
            padding: EdgeInsets.only(left: 60,right: 60),
            width: MediaQuery.of(context).size.width,
            height:100,
            child:  GridView.count(
              crossAxisCount:4 ,
              mainAxisSpacing: 0,
              crossAxisSpacing: 10,
              children: List.generate(4, (index){
                return GestureDetector(
                  onTap: (){

                    setState(() {
                      answer[index]="";
                      anwer_Map_indexes.remove(anwer_Map_indexes[index]);
                      anwer_Map_indexes.insert(index, 15);
                    });

                  },
                  child: Container(
                    width: 20,
                    height:20,
                    decoration:answer[index]==""?null: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                        color: Color(0xFFEFE07D),
                      boxShadow: [BoxShadow(
                        blurRadius: 10,
                        color: Colors.black26
                      )]
                    ),
                    child: Center(child: Text(answer[index],style: TextStyle(fontSize: 28),)),
                  ),
                );
              }),

            ),
          ),  // uchinchi qator 4 ta xarf
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            width: MediaQuery.of(context).size.width,
            height:200,
            child:  GridView.count(
              crossAxisCount:7 ,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(14, (index){
                return GestureDetector(
                    onTap: (){
                    setState(() {
                      
                      for(int i=0; i<answer.length; i++){
                        if(answer[i]=="" && bitta<1){
                          answer[i]=map[index]!;
                          bitta++;

                          bosilganVariant=index;
                        // anwer_Map_indexes.remove(anwer_Map_indexes[i]);
                          anwer_Map_indexes.insert(i, index);
                          
                        }
                        print("index:$index");
                      }
                    });
                    //  || bosilganVariant==index
                  },
                  child: Container(
                    width: 20,
                    height:20,
                    decoration:anwer_Map_indexes.contains(index) ?null: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                        color: Color(0xFFEFE07D),
                      boxShadow: [BoxShadow(
                        blurRadius: 10,
                        color: Colors.black26
                      )]
                    ),
                    child: Center(child: Text(anwer_Map_indexes.contains(index)?"":"${map[index]}",style: TextStyle(fontSize: 28),)),
                  ),
                );
              }),

            ),
          ),  // tortinchi 14 talik xarflar
         Column(children: [
           MaterialButton(    //Next
             onPressed: (){

             setState(() {

               String s=answer[0]+answer[1]+answer[2]+answer[3];
               print(berilganShart[nextPosition].hideWord);
                if(s==berilganShart[nextPosition].hideWord)
                {
                  nextPosition++;
                  func(berilganShart[nextPosition].hideWord);
                 answer=["","","",""];
                 anwer_Map_indexes.clear();
                 variantlar.clear();
                 level++;
                 money+=10;
                 nextPosition==berilganShart.length-1?Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalCloss(maney: money,level: level,))):null;
                hiveRepository.saveResult(ResultModal(level, money));

                }

             });

           },
             child: Text("Next",style: TextStyle(color: Colors.white),),
             color: Colors.blue,
             clipBehavior: Clip.antiAlias,),   //Next
           MaterialButton(  // help
             onPressed: (){
               setState(() {
                 for(int i=0; i<answer.length; i++) {
                   if (answer[i] == "" && bitta < 1 && money>=5) {
                     answer[i] = berilganShart[nextPosition].hideWord.split("")[i];
                     bitta++;
                     money-=5;
                     map.forEach((key, value) {
                       if(answer[i]==value){
                         anwer_Map_indexes.insert(i, key);
                       }
                     });

                   }
                 }
               });

             },
             child: Text("Help",style: TextStyle(color: Colors.white),),
             color: Colors.blueGrey,
             clipBehavior: Clip.antiAlias,)
         ],)


         // Rasm qismi
        ],),
      ),
    );
  }
}
