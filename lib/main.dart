
import 'package:bbd2/modules/splash_screen/splash.dart';
import 'package:bbd2/modules/splash_screen/splash_building.dart';
import 'package:bbd2/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
 // try {
// }catch(e){
// print(e);
// }
await GetStorage.init();
runApp(const MyApp());

}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bbd2',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: SplashBinding(),
      home: const SplashScreen(),
      getPages: AppPages.pages,
    );
  }
}
