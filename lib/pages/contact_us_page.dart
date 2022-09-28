import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class ContactUsPage extends StatelessWidget {
 ContactUsPage({Key? key}) : super(key: key);
 
 String name = '';
  String email = '';
  String message = '';
  String additional_details = '';
  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar( elevation: 5, toolbarHeight: 50, 
      title: const Text('SPORTIFY'),
       backgroundColor: const Color(0xCA81BB4E),
     ),
    backgroundColor: const Color(0xC7FFFFFF),

      body: Align(
        alignment:const Alignment(300,100),
         child: Row( 
         crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Column(
            children: [
              Container(
               alignment: Alignment.centerRight,
               padding:const EdgeInsets.symmetric(vertical: 300.0, horizontal: 100.0,),
               width: 40,
               decoration:const BoxDecoration(color: Color(0xCA81BB4E),), 
              ),
            ],
               
           ),
           
           Column(
            children: [
              Container(
                child:const SizedBox(
                width: 400 ,
               child: Text('\n\n\nGet In Touch', 
               style: TextStyle(fontStyle: FontStyle.normal, fontSize: 35, color: Color(0xFF8252C6),
              ),),),

              ),

           Container( 
           height: 120, 
           child:const Text('     Have any ideas or suggestions? Or would you like to report a problem? \n     Here is how to reach us...\n     _________________________________________________________________',
           style: TextStyle(fontStyle: FontStyle.normal, fontSize: 18,),),
           ),


           Column(children: [
            ElevatedButton( child:const Text('Contact us'), 
            onPressed: (){ 
              showDialog(
               context: context, 
               builder: (context) => AlertDialog(
                title:const Text('How can we help?\nLet us know in the form below.', 
                style: TextStyle(fontSize: 15 ),),
                content:(Form(key: formkey,
                child: Column(
                 children: [
                   Container(
                    height: 3,
                    width: 240,
                    decoration:const BoxDecoration(color: Color(0xCA81BB4E),),
                   ),
                   
                   TextFormField(
                    autofocus: true ,
                      decoration:const InputDecoration( 
                        labelText: 'Name',),
                   ),

                  const TextField(
                    autofocus: true ,
                      decoration: InputDecoration( 
                        labelText: 'Email',),
                   ),


                   TextFormField(
                    autofocus: true ,
                      decoration:const InputDecoration( 
                        labelText: 'Message',),
                   ),

                    TextFormField(
                      autofocus: true ,
                      decoration:const InputDecoration( 
                        labelText: 'Additional Details',),
                    ), ],
                     ),)),
                 
                 
                 actions: [
                  TextButton(onPressed:() => Navigator.pop(context), 
                  child:const Text('Cancel'),
                  ),
                  TextButton(onPressed:() {
                    showDialog(context: context, 
                    builder: ((context) => AlertDialog(
                    content:const Text('Are you you would like to submit?'),
                    actions: [
                      TextButton(onPressed:() => Navigator.pop(context), child:const Text('Yes') ), 
                      TextButton(onPressed:() => Navigator.pop(context), child:const Text('No') )
                    ],)));
                  }, 
                  child:const Text('Submit')
                  ),
                 ],), );},
              ),

           ],),

           
           ],
          ),
         ],
  
         
            ),
            ),);

            
            









         
}
          
 