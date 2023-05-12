

import 'package:bbd2/modules/scan_result/scan_controller.dart';
import 'package:get/get.dart';

 class ScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanController());
   // Get.lazyPut(() => ScanController().printAllData());

  }

}
