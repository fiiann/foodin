import 'package:flutter/material.dart';
import 'package:foodin/pages/widget/loadingIndicator.dart';
import 'package:get/get.dart';

import '../controller/bannerC.dart';
import 'component/corouselBanner.dart';
import 'component/serachWidget.dart';

class HomePage extends StatelessWidget {
  final bannerC = Get.find<BannerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(Icons.emoji_emotions_outlined, color: Colors.white,size: 30,),
                            SizedBox(width: 5,),
                            Text("FOOD.ID",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                fontSize: 20
                              ),
                            )
                          ],
                        ),
                         const Icon(Icons.chat_rounded,color: Colors.white)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: const [
                        Icon(Icons.add_location_rounded, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text("Dikirim ke ", style: TextStyle(color: Colors.white),),
                        Text("Jakarta Selatan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                        Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white,)
                      ],
                    ),
                    SearchHeader()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Obx((){
              if(bannerC.isLoading.value){
                return const CustomLoadingIndicator();
              }
              else{
                return CorouselBanner();
              }
            }),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   const Text("Special di FOOD.ID"),
                  const SizedBox(height: 10,),
                  Obx((){
                    if(bannerC.isLoading.value){
                      return const CustomLoadingIndicator();
                    }else{
                      return GridView.count(
                        // primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 2,
                        children: bannerC.modelBanner.value.data!.where((element) => element.bannerVariantId == 3).map((e) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            child: Image.network(e.media!,  fit: BoxFit.fill,),
                          );
                        }).toList()
                      );
                    }

                  }),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Text("Cari inspirasi belanja"),
            const SizedBox(height: 5,),
            Obx((){
              if(bannerC.isLoading.value){
                return const CustomLoadingIndicator();
              }else{
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: /*Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              color : Colors.transparent,
                              child: ClipRRect(

                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    bannerC.modelBanner.value.data![1].media!,
                                  height : MediaQuery.of(context).size.width/3,
                                    width :   MediaQuery.of(context).size.width/3,
                                  fit: BoxFit.,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                                width: MediaQuery.of(context).size.width/3,
                                child : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(bannerC.modelBanner.value.data![1].media!),
                                ))
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Container(
                            width: MediaQuery.of(context).size.width/3*1.5,
                            child : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                child: Image.network(bannerC.modelBanner.value.data![1].media!),
                        )),
                      ],
                    ),
                  )*/
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                child: Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      bannerC.modelBanner.value.data![1].media!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Expanded(
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      bannerC.modelBanner.value.data![1].media!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                bannerC.modelBanner.value.data![1].media!,
                                fit: BoxFit.fill,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                );
              }

            })
          ],
        ),
      ),
    );
  }
}
