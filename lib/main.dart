import 'package:flutter/material.dart';
import 'package:news_app/core/theme/my_theme.dart';
import 'package:news_app/pages/home_page/home_page.dart';
import 'package:news_app/pages/splach_page/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:MyTheme.lightTheme,
      initialRoute: SplashVEiw.routeName,

      routes: {
        SplashVEiw.routeName : (context) => SplashVEiw(),
       HomeView.routeName : (context) => HomeView(),
      },

    );
  }
}

