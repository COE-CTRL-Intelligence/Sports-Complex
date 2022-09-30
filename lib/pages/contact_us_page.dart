import 'package:flutter/material.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';

class ContactUsPage extends StatelessWidget {
 ContactUsPage({Key? key}) : super(key: key);
 
 String name = '';
  String email = '';
  String message = '';
  String additional_details = '';
  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();

  @override
 Widget build(BuildContext context){ 
   
   return BackgroundImageWidget(
    image: const AssetImage('assets/images/bg.jpg'),
    child: Scaffold(   
    appBar: AppBar( elevation: 5, toolbarHeight: 50, 
      title: const Text('SPORTIFY', ),
       backgroundColor:const Color(0xFF99CD32),
     ),
    backgroundColor: Colors.transparent,

      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 330),
         child: Row( 
         
          children: [ 
          Column(
            children: [
              Container( 
               alignment: Alignment.centerRight,
               padding:const EdgeInsets.symmetric(vertical: 150.0, horizontal: 100.0,),
               height: 422,
               width: 40,
               decoration:const BoxDecoration(color: Color(0xFF99CD32),
               borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)
               ) ,)
               , 
              ),
            ],
               
           ),
           

           Container( 
               alignment: Alignment.centerRight,
               padding:const EdgeInsets.symmetric(vertical: 150.0, horizontal: 300.0,),
               height: 3,
               width: 8,
               decoration:const BoxDecoration(color: Colors.transparent,
               borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)
               ) ,)
               , 
              ),
           Column(
            children: [
              Container( 
               decoration:const BoxDecoration(color: Color(0xD9D9D9D9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20)
               )),
                child:const SizedBox(
               width: 587,
               child: Text('\n   ...Need Help?\n   Get in touch\n', 
               style: TextStyle(fontStyle: FontStyle.normal, fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold
              ),),),

              ),

           Container( 
           decoration:const BoxDecoration(color: Color(0xD9D9D9D9),
           borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20)
           )),
           height: 233,
           width: 587, 
           child:const Text('     Do you have any ideas or suggestions? Or would you like to report a \n     problem? \n     Here\'s how to reach us.\n\n     _________________________________________________________________\n\n',
           style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18,),),
           ),


           Column(
            children: [
             
            ElevatedButton( child:const Text('Contact Us'), 
            onPressed: (){ 
              showDialog(
               context: context, 
               builder: (context) => AlertDialog(
                title:const Text('How can we help?\nLet us know in the form below.\n\n\nNote: All fields are required', 
                style: TextStyle(fontSize: 15 ),),
                content:(Form(key: formkey,
                child: Column(
                 children: [
                   Container(
                    height: 3,
                    width: 240,
                    decoration:const BoxDecoration(color: Color(0xFF99CD32),),
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
                    content:const Text('Are you\'d like to submit?'),
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
            ),) );}

            
            









         
}
          
 