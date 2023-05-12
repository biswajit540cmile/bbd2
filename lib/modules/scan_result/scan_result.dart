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







    //controller.storeData.erase();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        actions:  [

          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
                onTap:() {
                  if (controller.resultMap.isNotEmpty) {
                    controller.resultMap.remove(controller.resultMap.keys.first);
                    controller.storeData.remove(controller.resultMap.keys.first);

                  }

                },
                child: Icon(Icons.delete),),
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
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Recently Scanned BarCode:\n ${Get.arguments}",style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold),)),
              ),


              Center(
                child: Container(
                  child: Obx(()=>ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey
                    ),

                    itemCount: controller.resultMap.length,
                    itemBuilder: (BuildContext context, int index){
                      var key = controller.resultMap.keys.toList();

                      return Center(
                        child: ListTile(
                          leading: null,
                          title:Center(child: Text('Scaned Data: ${key[index]}')) ,
                          subtitle: Center(child: Text('Time: ${controller.resultMap[key[index]]}')),
                          // title: Text(controller.time[index]["valueT"]),
                        ),
                      );
                    },
                  ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
