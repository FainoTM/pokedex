import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_routes.dart';


Future<void> main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.homePage,
    getPages: AppRoutes.define(),
  ));
}