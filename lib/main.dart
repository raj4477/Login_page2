import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_page_2/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './size_config.dart';
import 'pages/form.dart';
import 'pages/login_page.dart';
import 'pages/sec_home.dart';
bool? seenOnboard;
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  // to show status bar
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false; //if null set to false
  runApp(MyApp());
  // runApp(HomePage());
}

 class MyApp extends StatefulWidget {
   @override
   _MyAppState createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
   @override

     Widget build(BuildContext context) {
       
       return MaterialApp(
         title: 'Flutter Login Page2',
         debugShowCheckedModeBanner: false,
        //  theme: ThemeData(
        //    primarySwatch: Colors.blue,
        //    backgroundColor: Colors.blue,
        //  ),
         
         home: seenOnboard==false ?OnBoardingPage(): LoginPage(),
        //  home : HomePage(),
       );
     }
   }


   



