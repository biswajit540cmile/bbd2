

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ScanController extends GetxController {
  final storeData = GetStorage();
  RxString scanData = ''.obs;

  RxMap resultMap = {}.obs;
  RxMap resultMap1 = {}.obs;


  Future<void> saveData(value) async{
    scanData.value = await value;
    await storeData.write(scanData.value,DateFormat('MMM d, h:mm a').format(DateTime.now()).toString());
   printAllData();
     update();
  }

  void printAllData() {

    storeData.getKeys().forEach((key) {

      var value = storeData.read(key);

      resultMap[key] = value;

    });

    final entrie = resultMap.entries.toList().reversed;
    for (final entry in entrie){
      resultMap1[entry.key] = entry.value;

    }
    update();
//     print(resultMap);
// print(resultMap1);


   // Map<dynamic, dynamic> reversedMap = Map.fromEntries(resultMap.entries.toList().reversed);
    // print(reversedMap);



  }

}



