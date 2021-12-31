import 'package:flutter/material.dart';
import 'package:login_page_2/size_config.dart';
import '../style.dart';
 class MyTextButton extends StatelessWidget {
    final String buttonName;
    final onPressed;
    final bgColor;
   const MyTextButton({ Key? key,
   required this.buttonName,
   required this.onPressed,
   required this.bgColor,
   }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
     return Padding(
       
       padding: const EdgeInsets.symmetric(horizontal: 20.0),
       
       child: Container(color: bgColor,
       margin: EdgeInsets.only(left: width*0.02,bottom: height*0.025),
       width: width*0.50,
       
         child: TextButton(

           child: Text(buttonName,
           style: kBodyText1,),
           onPressed: onPressed ,
           
         ),
       ),
     );
   }
 }

 class OnBoardNavBtn extends StatelessWidget {
   final name;
   final onPressed;
   const OnBoardNavBtn({ Key? key, required this.name, required this.onPressed }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Container(
       child: InkWell(
         onTap: onPressed,
         splashColor: Colors.black12,
         borderRadius: BorderRadius.circular(7.0),
         child: Padding(
           padding: const EdgeInsets.all(4.0),
           child: Text(name,
           style: kBodyText1,),
         ),
       ),
       
     );
   }
 }
 //export './widgets.dart';