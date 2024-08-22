import 'package:flutter/material.dart';

BottomNavigationBarItem BottomNav({required String image , required String text}){
  return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(image)),
      label: text);
}
