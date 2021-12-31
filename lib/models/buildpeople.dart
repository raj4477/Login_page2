

import 'package:flutter/material.dart';
import 'package:login_page_2/models/hero_dialog_route.dart';
import 'package:login_page_2/pages/sec_home.dart';
// class BuildPeople extends StatelessWidget {
//   //final icon;
//   const BuildPeople({ Key? key ,
//   // required this.icon
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Icon(Icons.person_pin),
//     );
//   }
// }


// class id{
//   final String tag;
//   id({required this.tag});

// }
// List <id> iD=[];



class BuildPeople extends StatefulWidget {
  final double? posH ;
  final double?  posW;
  final String id;
  const BuildPeople({ Key? key ,final double? this.posH , double? this.posW,
  required this.id
  }) : super(key: key);

  @override
  _BuildPeopleState createState() => _BuildPeopleState();
}

class _BuildPeopleState extends State<BuildPeople> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) => Center(
              child: getPopUpCard(widget.id),
            ),
          ),
        );
      },
      child: Hero(tag: widget.id,
        child: Icon(Icons.person_pin,size: 120,
        color: Colors.purple,),
      ),
    );
  }

  
}
List <BuildPeople> buildpeople = [];
Widget getPopUpCard(id) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: id,
              child:  Card(  
                
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(30.0),  
          ),  
          color: Colors.red,  
          elevation: 10,  
          child: Material(
             borderRadius: BorderRadius.circular(30.0),
            color: Colors.pink,
            child: Container(
              height: 220,
              width: 300,
              decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow:[ BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 20.0,spreadRadius: 4.0
              ),]
              ),
              
              child: Column(  
                mainAxisSize: MainAxisSize.min,  
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[  
                  const ListTile(  
                    leading: Icon(Icons.album, size: 60),  
                    title: Text(  
                      'Person',  
                      style: TextStyle(fontSize: 30.0)  
                    ),  
                    subtitle: Text(  
                      'Bio of Person',  
                      style: TextStyle(fontSize: 18.0)  
                    ),  
                  ),  
                  ButtonBar(  
                    buttonPadding: EdgeInsets.all(15.0),
                    children: <Widget>[  
                      ElevatedButton(  
                        child: const Text('Help'),  
                        onPressed: () {/* ... */},  
                      ),  
                      ElevatedButton(  
                        child: const Text('Exit'),  
                        onPressed: () { 
      //                     Navigator.push(
      //                                 context,
      //                            MaterialPageRoute(builder: (context) => HomePage()),
      // );
  },  
                      ),  
                    ],  
                  ),  
                ],  
              ),
            ),
          ),
          ),
                ),
          );
  }


   