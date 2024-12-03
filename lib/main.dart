import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/modules/home/home_page.dart';
import 'package:to_do/modules/splash/splash_binding.dart';
import 'package:to_do/modules/splash/splash_page.dart';
import 'modules/home/home_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To Do  Md Labs',

      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      initialBinding: SplashBinding(),
      // getPages: AppPages.pages,
      /// todo: separate pages in different file
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
            name: '/home',
            page: () => const HomePage(),
            binding: HomeBinding()),
      ],
    );
  }
}
