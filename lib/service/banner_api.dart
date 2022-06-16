import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/banner_model.dart';
import 'api.dart';

class BannerApi extends GetConnect{
  BannerApi(){
    httpClient.timeout = const Duration(seconds: 20);
  }

  Future<BannerRespon> getBanner() async{
    print("get banner");
    final response = await get(Api.apiHost);
    if (kDebugMode) {
      print("RESPONSE ${response.body}");
    }
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return BannerRespon.fromJson(response.body);
    }
  }
}