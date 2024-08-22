import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/widgets/custom_background.dart';
import 'package:islami_app/moduls/layout/screens/hadeth_screen.dart';
import 'package:islami_app/moduls/layout/screens/quran_screen.dart';
import 'package:islami_app/moduls/layout/screens/radio_screen.dart';
import 'package:islami_app/moduls/layout/screens/sebha_screen.dart';
import 'package:islami_app/moduls/layout/screens/settings_screen.dart';
import 'package:islami_app/moduls/layout/widgets/Botton_nav.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layoutScreen";

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const SettingsScreen(),
  ];

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    List<String> titles = ["islami", "hadeth", "sebha", "radio", "settings"];

    return CustomBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            titles[selectedIndex].tr(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              pageController.animateToPage(value,
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 800));
              setState(() {});
            },
            items: [
              BottomNav(
                  image: "assets/icons/quran_icn.png", text: "quran".tr()),
              BottomNav(image: "assets/icons/hadeth.png", text: "hadeth".tr()),
              BottomNav(image: "assets/icons/sebha.png", text: "sebha".tr()),
              BottomNav(image: "assets/icons/radio.png", text: "radio".tr()),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                ),
                label: context.tr("settings"),
              )
            ]),
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            selectedIndex = value;
            setState(() {});
          },
          children: screens,
        ),
      ),
    );
  }
}
