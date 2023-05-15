import 'package:bbd2/modules/homepage/home_binding.dart';
import 'package:bbd2/modules/homepage/home_page.dart';
import 'package:bbd2/modules/scan_result/scan_binding.dart';
import 'package:bbd2/modules/scan_result/scan_result.dart';
import 'package:bbd2/routes/app_routes.dart';
import 'package:get/get.dart';

import '../modules/splash_screen/splash.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () =>  const SplashScreen(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.scan,
      page: () => const ResultPage(),
      binding: ScanBinding(),
    ),
  ];
}
