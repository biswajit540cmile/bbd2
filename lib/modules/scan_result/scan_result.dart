import 'package:bbd2/modules/scan_result/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});
  @override
  Widget build(BuildContext context) {
   ScanController controller = Get.put(ScanController());
   controller.saveData(Get.arguments);


    return Scaffold(
      appBar: AppBar(
        elevation: zero,
        backgroundColor: platformDefault,
        centerTitle: true,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: num20),
            child: InkWell(
                onTap:() {
                 // controller.printAllData();

                  if (controller.resultMap.isNotEmpty) {

                    controller.storeData.remove(controller.resultMap.keys.first);
                     controller.resultMap1.remove(controller.resultMap1.keys.last);

                    controller.update();
                 }
                 },
                child:  Icon(Icons.delete),),
          ),
        ],
        leading: BackButton(
          onPressed: () => Get.back(),
        ),
        title: const Text(scanPageTitle),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(e8Dz),
                child: Center(child: Text("$recentScan \n ${Get.arguments}",style: const TextStyle(fontSize: num20, color: Colors.black87,fontWeight: FontWeight.bold),)),
              ),


              Center(
                child: Obx(()=>ListView.separated(

                  scrollDirection: Axis.vertical,
                  physics:  const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey
                  ),

                  itemCount: controller.resultMap1.length,
                  itemBuilder: (BuildContext context, int index){
                 //   Map<dynamic, dynamic> reversedMap = Map.fromEntries(controller.resultMap1.entries.toList().reversed);
                    var key = controller.resultMap1.keys.toList();
                   // var key = controller.resultMap.keys.toList().reversed.elementAt(index);
                   // dynamic value = controller.resultMap[key];

                    return Center(
                      child: ListTile(
                        leading: null,
                        title:Center(child: Text('$scanPageTitle ${key[index]}')),
                        subtitle: Center(child: Text('$time ${controller.resultMap1[key[index]]}')),
                      ),
                    );
                  },
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
