import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bannerC.dart';

class CorouselBanner extends StatelessWidget {
  final bannerC = Get.find<BannerController>();
  @override
  Widget build(BuildContext context) {
      return CarouselSlider(
        options: CarouselOptions(
            viewportFraction: 0.7,
            aspectRatio: 1.5,
            enlargeCenterPage: true,
            height: MediaQuery.of(context).size.height/5),
        items: bannerC.modelBanner.value.data!.where((element) => element.bannerVariantId == 1).map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  // decoration: const BoxDecoration(
                  //     color: Colors.amber
                  // ),
                  child: Image.network(i.media!),
                );
              },
            );

        }).toList(),
      );
  }
}
