import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/sidebar.dart';
import 'package:sports_complex/widgets/custom_signup_field.dart';

class GymSignUpPage extends StatefulWidget {
  const GymSignUpPage({Key? key}) : super(key: key);

  @override
  State<GymSignUpPage> createState() => _GymSignUpPageState();
}

class _GymSignUpPageState extends State<GymSignUpPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final repeatPasswordController = TextEditingController();

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          child: Center(
              child: Column(
        children: [
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(28)),
            child: const Center(
              child: Text('SIGN UP',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 70),
          CustomSignUpInputField(
              fieldController: emailController,
              fieldName: 'Email',
              obscureText: false,
              icon: Icons.alternate_email),
          const SizedBox(height: 10),
          CustomSignUpInputField(
              fieldController: passwordController,
              fieldName: 'Password',
              obscureText: true,
              icon: Icons.lock),
          const SizedBox(height: 10),
          CustomSignUpInputField(
            fieldController: repeatPasswordController,
            fieldName: 'Repeat Password',
            obscureText: true,
            icon: Icons.lock,
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.person_add,
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      primary: const Color(0xff83D475)),
                  label: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              const SizedBox(width: 5),
              InkWell(
                  onTap: () {
                    AutoRouter.of(context).pop(const GymLoginRoute());
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
      ))),
    );
  }
}
