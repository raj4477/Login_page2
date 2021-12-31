import 'package:dotted_border/dotted_border.dart';
//import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:login_page_2/style.dart';
import 'package:login_page_2/widgets/build_circle.dart';
import 'package:measured_size/measured_size.dart';
import '../size_config.dart';
import '../models/buildpeople.dart';
import 'dart:math';
Size wsize = Size.zero;
String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
double h=0.0;
double w = 0.0 ;
class HomePage  extends StatefulWidget {
  const HomePage ({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double  randnum(n){
    Random rand = new Random();
    double randNum = rand.nextDouble()*n;
    
   return randNum ;
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
     h =SizeConfig.screenHeight!;
     w = SizeConfig.screenWidth!;
    return SafeArea(
      child: Scaffold(
        
         appBar: AppBar(elevation: 0,),
         backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: w-15,
            width: w-15,
            color: Colors.white,
           
            child: Stack(
            //  alignment: AlignmentDirectional.center,
             // ignore: deprecated_member_use
            //  overflow: Overflow.clip,
              //clipBehavior: Clip.hardEdge,
              children: [
                // pos[0],
                // pos[1],
                // pos[2],
                // pos[3],
                Center(child: getCon(h, w)),
                
                
                  // Positioned( top: ((h*0.5)-((w-320)/2))-5,
                  // left: ((w*0.5-((w-320)/2))),.
                  for(final itr in buildpeople)
                   Positioned(top: itr.posW,
                   left: itr.posH,
                     child: itr,),
                  MeasuredSize(
                    onChange: (Size size){
                      setState(() {
                        wsize =size;
                      });
                    },
                    child: SizedBox(),
                  ),
    
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          // print(w);
          // print(h);
         double w1 = randnum(w-20);
         double h1 =randnum(w-20);
         String randstr = generateRandomString(15);
          setState(() {
            buildpeople.add(BuildPeople(posW: w1,posH: h1,id: randstr,));
            // iD.add(id(tag:randstr));
          });
          print(w1);
          print(h1);
          print(buildpeople.length);
          // print(wsize.width.toString());
          // print(wsize.height.toString());
          
        },
        child: Icon(
          Icons.add
        ),
        ),
    
    
      ),
    );
  }
}






/// [List.builder] && [List.seperator] was used to generate list of people in our stack widgets 
                // Positioned.fill(
                //                  child: ListView.separated(
                //                   //    physics: ClampingScrollPhysics(),
                //                   //  scrollDirection: Axis.horizontal,
                //                    //shrinkWrap: true,
                //                    separatorBuilder: (context ,index)=>Divider(
                //                      color: Colors.black,
                //                    ),
                //                    itemCount: buildpeople.length,
                //                    itemBuilder: ( context , index)=>Container(
                //                      child: buildpeople[index]
                //                    ),
                //                  ),
                // ),








// Widget getpeople(){
  
//   return Positioned(child: Container(),);
// }




// [ 
//   child: DottedBorder(
//             padding: EdgeInsets.all(50),
//             child: Container(
//               clipBehavior: Clip.none,
//              width: w*0.5,
//               height: h*0.25,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
//                color: Colors.brown,),
             
//       ),
//             borderType: BorderType.Circle,
//             strokeWidth: 4,
//             radius: Radius.circular(50),
            
//             color: Colors.red,
//             dashPattern: [25,10,25,10],
//           ),
//           ]


