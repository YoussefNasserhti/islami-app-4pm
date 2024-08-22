import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/moduls/layout/layout_screen.dart';
import 'package:provider/provider.dart';

import '../layout/provider/settings_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LayoutScreen.routeName,
            (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Image.asset(provider.themeMode == ThemeMode.light
        ? "assets/images/splash.png"
        : "assets/images/splash_dark.png");
  }
}
