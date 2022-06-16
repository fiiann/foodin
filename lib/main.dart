import 'package:flutter/material.dart';
import 'package:foodin/routes/app_pages.dart';
import 'package:foodin/routes/route_name.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodin',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      getPages: AppPages.pages,
      initialRoute: RouteName.home,
    );
  }
}