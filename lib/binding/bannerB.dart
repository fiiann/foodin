import 'package:foodin/controller/bannerC.dart';
import 'package:get/get.dart';

class BannerB implements Bindings {
  @override
  void dependencies() {
    Get.put(BannerController());
  }
}