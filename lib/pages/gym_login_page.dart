import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/utils/constants.dart';
import 'package:sports_complex/utils/snackbar_msg.dart';
import 'package:sports_complex/widgets/custom_input_field.dart';
import 'package:sports_complex/widgets/page_title.dart';
import '../widgets/side_bar.dart';
import 'package:http/http.dart' as http;

class GymLoginPage extends StatefulWidget {
  const GymLoginPage({Key? key}) : super(key: key);

  @override
  State<GymLoginPage> createState() => _GymLoginPageState();
}

class _GymLoginPageState extends State<GymLoginPage> {
  // Variables
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;

  // http login method
  Future<void> login(String email, String password) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, dynamic>{"email": email, "password": password}));

      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        String token = jsonData['token'].toString();
        getUserData(token);

        // If StatusCode != 200
      } else {
        toggleButtonLoad();
        if (!mounted) return;
        snackBarMessage(jsonData.toString(), context);
      }
    } catch (e) {
      snackBarMessage(e.toString(), context);
      toggleButtonLoad();
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
        AutoRouter.of(context).navigate(const HomeRoute());
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
                AutoRouter.of(context).push(const HomeRoute());
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  // Head
                  const PageTitle(title: 'LOG-IN'),
                  SizedBox(height: screenHeight * 0.1),

                  // Body
                  Column(
                    children: [
                      CustomInputField(
                          fieldName: 'Email',
                          fieldController: emailController,
                          type: CustomInputType.email,
                          icon: Icons.alternate_email),
                      const SizedBox(height: 10),
                      CustomInputField(
                          fieldController: passwordController,
                          twinFieldController: passwordController,
                          fieldName: 'Password',
                          type: CustomInputType.password,
                          icon: Icons.lock),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),

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
                                icon: const Icon(Icons.login),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    toggleButtonLoad();
                                    login(emailController.text,
                                        passwordController.text);
                                    toggleButtonLoad();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    primary: const Color(0xff83D475)),
                                label: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          const SizedBox(width: 5),
                          InkWell(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const GymSignUpRoute());
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
