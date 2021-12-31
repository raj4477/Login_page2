import 'package:flutter/material.dart';
import './form.dart';
import '../size_config.dart';
import '../style.dart';
class LoginPage extends StatefulWidget {
   @override
   _LoginPageState createState() => _LoginPageState();
   }

   class _LoginPageState extends State<LoginPage> {
   @override
   
   Widget build(BuildContext context) {
     SizeConfig().init(context);
    double screenWidth = SizeConfig.screenWidth!;
    double screenHeight = SizeConfig.screenHeight!;
   return Scaffold(
   body: Column(
   children: [
   Expanded(
     child: Container(
     height: screenHeight-0.5*screenHeight,
     width: screenWidth,
     decoration:BoxDecoration(
     // borderRadius: BorderRadius.only(
     // bottomLeft: Radius.circular(50),
     // bottomRight: Radius.circular(50),
     // ),
    //  color: Color(0xff181F29),
    color: Colors.white,


     ) ,
     child: CircleAvatar(
       radius: 200,
      //  foregroundColor: Color(0xff181f29) ,
      // last used was backgroundColor<--->
      // backgroundColor: Color(0xff181f29),
      backgroundColor: Colors.white,
     //backgroundColor: kScaffoldBackground,
       child: Image.asset('images/login_illus.png'
       , ),
     ),
     ),
   ),
   Expanded(
     child: Container(
     width: 600,
     height: 600,

     decoration:BoxDecoration(
      //  last in used ==>
      color: Colors.white.withOpacity(0.4),
    //  color: Color(0xff181f29), 
     // borderRadius: BorderRadius.only(
     // bottomLeft: Radius.circular(50),
     // bottomRight: Radius.circular(50),
     // topLeft: Radius.circular(50),
     // topRight: Radius.circular(50),
     // ),
     ),

     child: MyCustomForm(),

     ),
   )
   ],
   ),

   );
   }
   }