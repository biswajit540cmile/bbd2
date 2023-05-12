import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Get.offNamed(AppRoutes.home));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: ,
        color: Colors.blue[900],
        child: Center(child: Image.asset('assets/splash_logo.png')),
      ),
    );
  }
}
