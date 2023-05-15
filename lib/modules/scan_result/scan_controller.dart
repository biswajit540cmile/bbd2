

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ScanController extends GetxController {
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   printAllData();
  //   update();
  // }
  final storeData = GetStorage();
  RxString scanData = ''.obs;

  RxMap resultMap = {}.obs;

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
      update();
    });


  }

}



