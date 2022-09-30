import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
 final double coverHeight = 270;
 @override
 Widget build(BuildContext context) { 
  return Scaffold(
    appBar: AppBar( elevation: 5, toolbarHeight: 50, 
      title: const Text('SPORTIFY', ),
       backgroundColor:const Color(0xFF99BD32),
     ),
    body: ListView( padding: EdgeInsets.zero,
    children: <Widget>[ 
      buildtop(),
      buildContent(), ],
    ), 
  );
 }

Widget buildContent() => Column(
  children:const [
   
                  SizedBox(
                    height: 50,
                    child: Text(
                      '   \nDescription',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  SizedBox(
                    child: Text(
                      '    Sportify is a mobile app for students of Kwame Nkrumah University of Science \n and Technology and non-stuudents which serves \n  as a mobile companion for the GUSSS sports complex. \n     Its main objective is to bring functions related to using the GUSSS sports \n       complex to mobile devices.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      '\nDeveloper',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      '    Kwame Nkrumah \n  University of Science \n      and Technology \n            (KNUST)',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

  ],
);


Widget buildtop(){
  return Stack(
      alignment: Alignment.center,
      children:[  buildCoverImage(), 
      
      const Text('About Us', style: TextStyle(
        fontStyle: FontStyle.normal, 
        fontSize: 45, color: Color.fromARGB(225, 255, 255, 255), 
        fontWeight: FontWeight.bold
              ),),],);
      
}

 Widget buildCoverImage() => Container(
  color: Colors.transparent,
  child:  Image(image:const AssetImage('assets/images/bball_court.jpg' , 
  ),fit: BoxFit.fitWidth,
  width: double.infinity,
  height: coverHeight,),


  

 );

 
 }