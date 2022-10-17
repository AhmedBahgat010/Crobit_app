import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/registration/Login/cubit/States.dart';
import 'package:app_final/view/registration/Login/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/components/button_registration.dart';
import '../../../core/style/my_colors.dart';
import '../../../core/components/DefaultFormField.dart';
import '../../../network/data_resources/local/shared_preferences.dart';
import '../../Home/HomeLayout.dart';
import '../signin/registra.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: SafeArea(
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              if (state.loginModel.status) {
                CacheHelper.saveData(
                        key: 'token', value: state.loginModel.data?.token)
                    .then((value) {
                  navigateAndFinished(context, const HomeLayout());
                });
                Fluttertoast.showToast(
                    msg: state.loginModel.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                Fluttertoast.showToast(
                    msg: state.loginModel.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: ListView(
                children: [
                  Form(
                    key:        LoginCubit.get(context)?.formKey,
                    child: Stack(
                      children: [
                        // Positioned(
                        //     top: -250,
                        //     right: -250,
                        //     child: Transform(
                        //         alignment: FractionalOffset.center,
                        //         transform: Matrix4.rotationZ(
                        //           3.1415926535897932 / 1,
                        //         ),
                        //         child: Image.asset(
                        //           'assets/images/Pngtre.png',
                        //           height: 500,
                        //         ))),         Positioned(
                        //   bottom: -250,
                        //   left: -200,
                        //   child: Image.asset(
                        //     'assets/images/Pngtre.png',
                        //     height: 400,color: Colors.grey.shade200,
                        //   ),
                        // ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('LOGIN', style: loginStyle),

                                Text('Please sign in to continue',
                                    style: grayText),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 11,
                                ),

                                DefaultFormField(
                                  hintText: "Email",
                                  labelText: "Email",
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (v) =>
                                      v.isEmpty ? "Email is Required" : null,
                                  prefixIcon: Icons.email_outlined,
                                ),
                                const SizedBox(height: 10),
                                DefaultFormField(
                                  hintText: "Password",
                                  labelText: "Password",
                                  controller: passwordController,
                                  isPassword: true,
                                  validator: (v) =>
                                      v.isEmpty ? 'Password required' : null,
                                  prefixIcon: Icons.lock_outlined,

                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: Text("Forgot password",
                                            style: labelStyle)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ConditionalBuilder(
                                  condition: state is! LoginLoadingtState,
                                  builder: (context) => ButtonSign(
                                    text: 'Sign in',
                                    ontap: () {

                                        // print(emailController?.text);

                                        LoginCubit.get(context)?.userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);

                                    },
                                  ),
                                  fallback: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),

                                const SizedBox(
                                  height: 30,
                                ),
                                // text or and line///////////////////////////
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        height: 2.0,
                                        color: lightGray,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: const Text("  or sign in with  ",
                                          style: TextStyle(
                                              color: lightGray, fontSize: 19)),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 2.0,
                                        color: lightGray,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ////   icon facebook and gmail
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      // height: 100,
                                      child: Image.asset(
                                        'assets/images/facebook.png',
                                        width: 100,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 35,
                                      // height: 40,
                                      child: Image.asset(
                                          'assets/images/google.png'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account? ",
                                        style: grayText),
                                    InkWell(
                                        onTap: () {
                                          navigateTo(context, RegisterScreen());
                                        },
                                        child: Text(' Sign up',
                                            style: TextLoginButton)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
