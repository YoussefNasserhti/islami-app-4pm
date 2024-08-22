import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../moduls/layout/provider/settings_provider.dart';

class CustomBackground extends StatelessWidget {
  Widget child;
   CustomBackground({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.themeMode == ThemeMode.light ? "assets/images/screens_bg.png": "assets/images/dark_bg.png"),fit: BoxFit.cover)),
      child: child
    );
  }
}
