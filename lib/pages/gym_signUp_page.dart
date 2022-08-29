import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/custom_input_field.dart';
import 'package:sports_complex/widgets/custom_radio_button.dart';
import 'package:sports_complex/widgets/sidebar.dart';
import 'package:http/http.dart' as http;

class GymSignUpPage extends StatefulWidget {
  const GymSignUpPage({Key? key}) : super(key: key);

  @override
  State<GymSignUpPage> createState() => _GymSignUpPageState();
}

class _GymSignUpPageState extends State<GymSignUpPage> {
  // Variables
  Gender? _gender;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  // http register/signup method
  Future<void> register(
      String name, String email, String password, String gender) async {
    try {
      var response = await http.post(
          Uri.parse('http://172.20.10.2:5050/api/v1/auth/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, dynamic>{
            "name": name,
            "email": email,
            "password": password,
            "gender": gender
          }));

      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        debugPrint('Created User');
        var token = jsonData['token'];
        var userName = jsonData['user']['name'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('login', token);
        pref.setString('userName', userName);
        if (!mounted) return;
        AutoRouter.of(context).replace(const GymDashboardRoute());
      } else {
        debugPrint('Something went wrong');
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            content: jsonData.isNotEmpty
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      jsonData.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ])
                : const Text('Something went wrong, please try again later')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text(
              'Something went wrong, please try again later.',
              style: TextStyle(color: Colors.white),
            ),
          ])));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // AutoRouter.of(context).navigate(const GymLoginRoute());
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffC2C3A0),
        endDrawer: const Sidebar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(const GymLoginRoute());
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                  child: Column(
                children: [
                  // Head
                  Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                      child: Text('SIGN-UP',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),

                  // Body
                  Column(
                    children: [
                      CustomInputField(
                          fieldController: nameController,
                          fieldName: 'Name',
                          icon: Icons.book),
                      CustomInputField(
                          type: CustomInputType.email,
                          fieldController: emailController,
                          fieldName: 'Email',
                          icon: Icons.alternate_email),
                      CustomInputField(
                          fieldController: passwordController,
                          twinFieldController: repeatPasswordController,
                          fieldName: 'Password',
                          type: CustomInputType.password,
                          icon: Icons.lock),
                      CustomInputField(
                        fieldController: repeatPasswordController,
                        fieldName: 'Repeat Password',
                        type: CustomInputType.password,
                        icon: Icons.lock,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            height: 28,
                            width: 10,
                          ),
                          Text('Gender')
                        ],
                      ),
                      Row(
                        children: [
                          CustomRadioButton(
                            title: Gender.male.name,
                            value: Gender.male,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomRadioButton(
                            title: Gender.female.name,
                            value: Gender.female,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Tail
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.person_add,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    _gender != null) {
                                  debugPrint('Validation Passed!!!');
                                  // debugPrint(_gender!.name[0].toUpperCase());
                                  register(
                                      nameController.text,
                                      emailController.text,
                                      passwordController.text,
                                      _gender!.name[0].toUpperCase());
                                } else {
                                  debugPrint('Validation Failed!!!');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  primary: const Color(0xff83D475)),
                              label: const Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          const SizedBox(width: 5),
                          InkWell(
                              onTap: () {
                                // AutoRouter.of(context)
                                // .navigate(const GymLoginRoute());
                              },
                              child: const Text(
                                'login',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
