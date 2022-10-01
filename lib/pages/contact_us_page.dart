import 'package:flutter/material.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';
import 'package:sports_complex/widgets/side_bar.dart';

// ignore: must_be_immutable
// class ContactUsPage extends StatefulWidget {
//   ContactUsPage({Key? key}) : super(key: key);

//   @override
//   State<ContactUsPage> createState() => _ContactUsPageState();
// }

// class _ContactUsPageState extends State<ContactUsPage> {
//   bool ignore = true;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       setState(() {
//         ignore = false;
//       });
//     });
//   }

//   String name = '';

//   String email = '';

//   String message = '';

//   // ignore: non_constant_identifier_names
//   String additional_details = '';

//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     double sH = MediaQuery.of(context).size.height;
//     double sW = MediaQuery.of(context).size.height;

//     // return BackgroundImageWidget(
//     // image: const AssetImage('assets/images/bg.jpg'),
//     // child: SafeArea(
//     //   child: IgnorePointer(
//     //       ignoring: ignore,
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 5,
//         toolbarHeight: 50,
//         title: const Text(
//           'SPORTIFY',
//         ),
//         backgroundColor: const Color(0xFF99CD32),
//       ),
//       // backgroundColor: Colors.transparent,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 330),
//         child: Row(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   alignment: Alignment.centerRight,
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 110.0,
//                     horizontal: 90.0,
//                   ),
//                   height: 350,
//                   width: 40,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF99CD32),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         bottomLeft: Radius.circular(10)),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.symmetric(
//                 vertical: 150.0,
//                 horizontal: 300.0,
//               ),
//               height: 3,
//               width: 8,
//               decoration: const BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     bottomLeft: Radius.circular(20)),
//               ),
//             ),
//             Column(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                       color: Color(0xD9D9D9D9),
//                       borderRadius:
//                           BorderRadius.only(topRight: Radius.circular(20))),
//                   child: const SizedBox(
//                     height: 250,
//                     width: 250,
//                     child: Text(
//                       '\n   ...Need Help?\n   Get in touch\n',
//                       style: TextStyle(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 25,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 // Container(
//                 //   decoration: const BoxDecoration(
//                 //       color: Color(0xD9D9D9D9),
//                 //       borderRadius: BorderRadius.only(
//                 //           bottomRight: Radius.circular(20))),
//                 //   height: 233,
//                 //   width: 587,
//                 //   child: const Text(
//                 //     '     Do you have any ideas or suggestions? Or would you like to report a \n     problem? \n     Here\'s how to reach us.\n\n     _________________________________________________________________\n\n',
//                 //     style: TextStyle(
//                 //       fontStyle: FontStyle.italic,
//                 //       fontSize: 18,
//                 //     ),
//                 //   ),
//                 // ),
//                 Column(
//                   children: [
//                     ElevatedButton(
//                       child: const Text('Contact Us'),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: const Text(
//                               'How can we help?\nLet us know in the form below.\n\n\nNote: All fields are required',
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             content: (Form(
//                               key: formkey,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: 3,
//                                     width: 240,
//                                     decoration: const BoxDecoration(
//                                       color: Color(0xFF99CD32),
//                                     ),
//                                   ),
//                                   TextFormField(
//                                     autofocus: true,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Name',
//                                     ),
//                                   ),
//                                   const TextField(
//                                     autofocus: true,
//                                     decoration: InputDecoration(
//                                       labelText: 'Email',
//                                     ),
//                                   ),
//                                   TextFormField(
//                                     autofocus: true,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Message',
//                                     ),
//                                   ),
//                                   TextFormField(
//                                     autofocus: true,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Additional Details',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: const Text('Cancel'),
//                               ),
//                               TextButton(
//                                   onPressed: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: ((context) => AlertDialog(
//                                               content: const Text(
//                                                   'Are you\'d like to submit?'),
//                                               actions: [
//                                                 TextButton(
//                                                     onPressed: () =>
//                                                         Navigator.pop(context),
//                                                     child: const Text('Yes')),
//                                                 TextButton(
//                                                     onPressed: () =>
//                                                         Navigator.pop(context),
//                                                     child: const Text('No'))
//                                               ],
//                                             )));
//                                   },
//                                   child: const Text('Submit')),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//     //             ),
//     //       ));
//   }
// }

class ContactUsPage extends StatelessWidget {
  ContactUsPage({Key? key}) : super(key: key);
  String name = '';

  String email = '';

  String message = '';

  // ignore: non_constant_identifier_names
  String additional_details = '';

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return BackgroundImageWidget(
      image: const AssetImage('assets/images/bg.jpg'),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 216, 215, 215),
          // endDrawer: const Sidebar(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 1.0,
            title: const Text("Contact Us"),
            titleSpacing: 0,
          ),
          body: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: sH * 0.5,
                        width: sW * 0.1,
                        decoration: const BoxDecoration(
                          color: Color(0xFF99CD32),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                      ),
                      SizedBox(width: sW * 0.04),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 30.0,
                        ),
                        height: sH * 0.5,
                        width: sW * 0.7,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 15),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 239, 239, 237),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Row(
                          children: [
                            // Padding(padding: EdgeInsets.only(left: 20, top: 20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '\n   ...Need Help?\n   Get in touch\n',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Do you have any ideas or \nsuggestions? \nOr would you like to report \na problem? \nHere\'s how to reach us.\n\n ____________________________\n\n',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  child: const Text('Contact Us'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'How can we help?\nLet us know in the form below.\n\n\nNote: All fields are required',
                          style: TextStyle(fontSize: 15),
                        ),
                        content: (Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                width: 240,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF99CD32),
                                ),
                              ),
                              TextFormField(
                                autofocus: true,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              const TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                ),
                              ),
                              TextFormField(
                                autofocus: true,
                                decoration: const InputDecoration(
                                  labelText: 'Message',
                                ),
                              ),
                              TextFormField(
                                autofocus: true,
                                decoration: const InputDecoration(
                                  labelText: 'Additional Details',
                                ),
                              ),
                            ],
                          ),
                        )),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          content: const Text(
                                              'Are you sure you would like to submit?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('Yes')),
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('No'))
                                          ],
                                        )));
                              },
                              child: const Text('Submit')),
                        ],
                      ),
                    );
                  },
                ),
              ]))),
    );
  }
}
