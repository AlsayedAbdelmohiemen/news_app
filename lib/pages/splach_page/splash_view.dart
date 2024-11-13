import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page/home_page.dart';

class SplashVEiw extends StatefulWidget {
  static const String routeName = "Splash";

  @override
  State<SplashVEiw> createState() => _SplashVEiwState();
}

class _SplashVEiwState extends State<SplashVEiw> {
  @override
  void initState() {
    super.initState();
    // Delay navigation by 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,

          body: Center(child: Image.asset("assets/images/logo.png"))),
    );
  }
}
