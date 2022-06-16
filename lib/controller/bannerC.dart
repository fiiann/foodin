import 'package:flutter/material.dart';
import 'package:foodin/model/banner_model.dart';
import 'package:get/get.dart';

import '../service/banner_api.dart';

class BannerController extends GetxController with WidgetsBindingObserver{
  var isLoading = false.obs;
  var modelBanner = BannerRespon().obs;
  var keyword = ''.obs;
  @override
  void onInit() {
    print("init");
    initData();
  }

  void initData() async{
    isLoading.value = true;
    modelBanner.value = await getBanner();
    isLoading.value = false;
  }

  Future<BannerRespon> getBanner() async {
    BannerRespon bannerRespon = await BannerApi().getBanner();
    return bannerRespon;
  }
}