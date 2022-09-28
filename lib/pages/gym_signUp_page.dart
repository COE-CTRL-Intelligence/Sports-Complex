import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/utils/snackbar_msg.dart';
import 'package:sports_complex/widgets/custom_input_field.dart';
import 'package:sports_complex/widgets/custom_radio_button.dart';
import 'package:sports_complex/widgets/page_title.dart';
import 'package:sports_complex/widgets/side_bar.dart';
import 'package:sports_complex/utils/constants.dart';
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
  bool isVisible = true;

  // http register/signup method
  Future<void> register(
      String name, String email, String password, String gender) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/auth/register'),
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
        var token = jsonData['token'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('login', token);
        getUserData(token);

        // If StatusCode != 201
      } else {
        if (!mounted) return;
        snackBarMessage(jsonData.toString(), context);
        toggleButtonLoad();
      }
    } catch (e) {
      toggleButtonLoad();
      snackBarMessage(e.toString(), context);
    }
  }

  // Toggles Load indicator on button
  void toggleButtonLoad() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  // http getUserData method
  void getUserData(String token) async {
    try {
      var response =
          await http.get(Uri.parse('$baseURL/users'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });

      var userData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        String jsonResString = jsonEncode(userData).toString();
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('gymPassPref', jsonResString);
        if (!mounted) return;
        AutoRouter.of(context).replace(const GymDashboardRoute());
      }
    } catch (e) {
      toggleButtonLoad();
      snackBarMessage(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).navigate(const GymLoginRoute());
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
                  const PageTitle(title: 'SIGN-UP'),
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
                        child: Visibility(
                          visible: isVisible,
                          replacement: const CircularProgressIndicator(),
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
                                    toggleButtonLoad();
                                    register(
                                        nameController.text,
                                        emailController.text,
                                        passwordController.text,
                                        _gender!.name[0].toUpperCase());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    primary: const Color(0xff83D475)),
                                label: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
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
                                AutoRouter.of(context)
                                    .navigate(const GymLoginRoute());
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
