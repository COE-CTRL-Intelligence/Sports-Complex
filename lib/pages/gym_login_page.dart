import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/custom_input_field.dart';
import '../widgets/sidebar.dart';
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
      var response = await http.post(
          Uri.parse('http://172.20.10.2:5050/api/v1/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, dynamic>{"email": email, "password": password}));

      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var token = jsonData['token'];
        var userName = jsonData['user']['name'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('login', token);
        pref.setString('userName', userName);
        debugPrint(userName);
        if (!mounted) return;
        AutoRouter.of(context).replace(const GymDashboardRoute());
      } else {
        // debugPrint(jsonData.toString());
        toggleLoad();
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
      toggleLoad();
    }
  }

  void toggleLoad() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  // Check if user already logged in
  void isLogged() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('login');
    if (token != null) {}
  }

  // http getUserData method
  void getUserData(String token) async {
    try {
      Map<String, dynamic> userData;
      var response = await http.get(
          Uri.parse('http://172.20.10.2:5050/api/v1/users'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          });

      userData = jsonDecode(response.body)["user"];

      if (response.statusCode == 200) {
        if (!mounted) return;
        AutoRouter.of(context).replace(const GymDashboardRoute());
      } else {
        debugPrint(userData.toString());
        debugPrint('Something went wrong retrieving data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogged();
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
                  Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                      child: Text('LOG-IN',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
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
                                    toggleLoad();
                                    login(emailController.text,
                                        passwordController.text);
                                  } else {
                                    debugPrint('Validation Failed');
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
