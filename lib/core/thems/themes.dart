
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static const Color yellowLightColor = Color(0xffB7935F);
  static const Color yellowDarkColor = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    appBarTheme:AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Color(0xff242424)),

      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.tajawal(
        textStyle: const TextStyle(fontSize: 30,
            color: Color(0xff242424),
            fontWeight: FontWeight.bold)
      ),
    ),
    textTheme:const TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: yellowLightColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff242424),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
    dividerTheme: const DividerThemeData(
      color: yellowLightColor,
      thickness: 3
    )
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.tajawal().fontFamily,
      primaryColor: Color(0xff141A2E),

    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: GoogleFonts.tajawal(
          textStyle: const TextStyle(fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold)
      ),
    ),
      textTheme:const TextTheme(
        bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),

      ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141A2E),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: yellowDarkColor,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
      dividerTheme: const DividerThemeData(
        color: yellowDarkColor,
        thickness: 3
      )

  );
}