import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/custom_input_field.dart';
import '../widgets/sidebar.dart';

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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton.icon(
                            icon: const Icon(
                              Icons.login,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                debugPrint('Validation Passed!!!');
                              } else {
                                debugPrint('Validation Failed');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                primary: const Color(0xff83D475)),
                            label: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
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
    );
  }
}
