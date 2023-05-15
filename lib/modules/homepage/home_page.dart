import 'package:bbd2/modules/homepage/home_controller.dart';
import 'package:bbd2/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> scanQR() async {
    try {
      var value = await FlutterBarcodeScanner.scanBarcode(
          scannerLineColor, scannerCancelBtn, true, ScanMode.BARCODE);
      value != conditionMone
          ? Get.toNamed(AppRoutes.scan, arguments: value)
          : blankString;

    } catch (e) {
      () => Get.snackbar(scanAgainTxt, '$e',
          colorText: Colors.white,
          backgroundColor: platformDefault,
          mainButton: TextButton(
              onPressed: Get.back,
              child: const Text(
                okBtn,
                style: TextStyle(color: Colors.red),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
              leading: null,
              backgroundColor: platformDefault,
              centerTitle: true,
              title: const Text(projTitle)),
          body: Builder(builder: (BuildContext context) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Center(
                    child: Text(
                      plzClickToTxt,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: num30,
                          fontFamily: fontInter),
                    ),
                  ),
                  const Center(
                    child: Text(
                      scanTxt,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: num30,
                          fontFamily: fontInter),
                    ),
                  ),
                  SizedBox(height: phnHeight * zD12),
                  SvgPicture.asset(arrowImgLink),
                  SizedBox(height: phnHeight * zD12),
                  InkWell(
                    onTap: scanQR,
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                          color: platformDefault, shape: BoxShape.circle),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(e8Dz),
                          child: SvgPicture.asset(scanImgLink),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: phnHeight * zDz5),
                ]);
          })),
    );
  }
}
