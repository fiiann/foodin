
import 'package:foodin/binding/bannerB.dart';
import 'package:foodin/pages/home_page.dart';
import 'package:foodin/routes/route_name.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
      binding: BannerB()
    ),
  ];
}