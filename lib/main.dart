import 'package:flutter/material.dart';
import 'package:movieshowbook_app/utils/routes.dart';
import 'package:movieshowbook_app/view/screens/detail_page.dart';
import 'package:movieshowbook_app/view/screens/home_page.dart';
import 'package:movieshowbook_app/view/screens/showbook_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffFEFAE0)),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        Routes.homePage: (context) => const HomePage(),
        Routes.detailPage: (context) => const DetailPage(),
        Routes.showBookingPage: (context) => const ShowBook(),
      },
    );
  }
}
