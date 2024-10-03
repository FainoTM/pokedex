
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'view/home_page.dart';


class AppRoutes {
  static const homePage = '/view/homePage';
  static const detailPage = '/view/detail_page';

  static List<GetPage> define() {
    return [
      GetPage(name: homePage, page: () => HomePage()),
      /*GetPage(
          name: detailPage,
          page: () {
            final Country country = Get.arguments;
            return DetailPage(country: country);
          }) */
    ];
  }
}