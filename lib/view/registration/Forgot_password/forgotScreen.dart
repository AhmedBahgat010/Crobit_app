import 'package:app_final/core/components/DefaultFormField.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../core/components/button_registration.dart';
import '../../../core/style/my_style.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              Image.asset('assets/images/password.png', height: 200),
              const SizedBox(height: 10),
              Text(
                'Forgot your password?',
                style: TextLoginButton,
              ),
              const SizedBox(height: 10),
              Text(
                'Enter your registered email below to receive password reset instruction',
                style: hintStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultFormField(
                hintText: "Email",
                labelText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v.isEmpty ? "Email is Required" : null,
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 30),

              ConditionalBuilder(
                condition: true,
                builder: (context) => ButtonSign(
                  text: 'Sent',
                  ontap: () {

                    // print(emailController?.text);



                  },
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
