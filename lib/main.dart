import 'package:flutter/material.dart';
import 'package:payjet/screens/CreditCardBillPayment.dart';
import 'package:payjet/screens/DthRecharge.dart';
import 'package:payjet/screens/ElectricityBills.dart';
import 'package:payjet/screens/FastTagRecharge.dart';
import 'package:payjet/screens/GasBill.dart';
import 'package:payjet/screens/MobileRecharge.dart';
import 'package:payjet/screens/PostpaidRechrge.dart';
import 'package:payjet/screens/Profile.dart';
import 'package:payjet/screens/SplashScreen.dart';
import 'AuthScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        cardColor: Colors.white,
        searchBarTheme: const SearchBarThemeData(),
        tabBarTheme: const TabBarTheme(),
        dialogTheme: const DialogTheme(
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)), // Set the border radius of the dialog
          ),
        ),
        buttonTheme: const ButtonThemeData(),
        popupMenuTheme: const PopupMenuThemeData(
            color: Colors.white, shadowColor: Colors.white),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
        ),
        cardTheme: const CardTheme(
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          color: Colors.white,
        ),

        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            // overlayColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme: const ColorScheme.light(background: Colors.white)
            .copyWith(background: Colors.white),
      ),
      home:Splash()
    );
  }
}
