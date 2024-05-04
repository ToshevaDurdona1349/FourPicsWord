import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/result_modal.dart';
class HiveRepository{
  final Box _box=Hive.box("natija");
  late ResultModal resultModal;

  saveResult( ResultModal resultModal){
    _box.put("key", resultModal);
  }

  ResultModal getInformation(){
    return _box.get("key",defaultValue:resultModal);
  }

}