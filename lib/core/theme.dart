import 'package:flutter/material.dart';
class apptheme{
  static final ThemeData lighttheme=ThemeData(
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      elevation: 0
    ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              color: Colors.black
          )
      ),
    useMaterial3: false,
    primaryColor: const Color(0xffDFECDB),
    scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
      color: Colors.white
  ),
    iconTheme: IconThemeData(color: Colors.black)
  );

      static final ThemeData darktheme=ThemeData(


        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white
          )
        ),
        useMaterial3: false,
      primaryColor: Color(0xff060E1E),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xff141922),
      ),
          cardTheme: CardTheme(
              color: Colors.black,

          ),
          iconTheme: IconThemeData(color: Colors.white)


      );
}

