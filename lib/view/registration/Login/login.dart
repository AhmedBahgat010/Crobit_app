import 'dart:async';

import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/registration/Forgot_password/forgotScreen.dart';

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
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'cubit/States.dart';
import 'cubit/cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RoundedLoadingButtonController? _btnController =
      RoundedLoadingButtonController();

  // void _doSomething() async {
  //   Timer(Duration(seconds: 3), () {
  //     LoginCubit.get(context)?.userLogin(
  //                 email: emailController.text,
  //                 password: passwordController.text);
  //             navigateAndFinished(context, const HomeLayout());
  //     _btnController?.success();
  //
  //     Timer(Duration(seconds: 1), () {
  //       navigateAndFinished(context, const HomeLayout());
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: SafeArea(
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              print(state);
              print("Ddddddddddddd");
              CacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                navigateAndFinished(context, const HomeLayout());
              });

            }
            if (state is LoginErrorState) {
              print(state);
              print("${ state.message.toString()}""Ddddddddddddd");
              Fluttertoast.showToast(
                  msg: state.message.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: LoginCubit.get(context)?.formKey,
                  child: Column(
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
                      //           height: 450,
                      //         ))),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image.asset('assets/images/login.png',
                                    height: 200)),
                            SizedBox(
                              height: 20,
                            ),

                            Text('LOGIN', style: loginStyle),

                            Text('Please sign in to continue', style: grayText),
                            SizedBox(
                              height: 30,
                            ),

                            DefaultFormField(
                              hintText: "Email",
                              labelText: "Email",
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (v) =>
                                  v.isEmpty ? "Email is Required" : null,
                              prefixIcon: Icons.email,
                            ),
                            const SizedBox(height: 10),
                            DefaultFormField(
                              hintText: "Password",
                              labelText: "Password",
                              controller: passwordController,
                              isPassword: true,
                              validator: (v) =>
                                  v.isEmpty ? 'Password required' : null,
                              prefixIcon: Icons.lock,
                            ),
                            const SizedBox(height: 10),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                  onTap: () {
                                    navigateTo(context, ForgotScreen());
                                  },
                                  child: Text("Forgot password ?",
                                      style:
                                          labelStyle.apply(fontSizeDelta: -3))),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // RoundedLoadingButton(
                            //   child: Text('Login',
                            //       style: TextStyle(
                            //           color: AppColor.white,
                            //           fontSize: 22,
                            //           fontWeight: FontWeight.w600)),
                            //   controller: _btnController!,
                            //   onPressed: _doSomething,
                            //   color: AppColor.greenDark,
                            //   borderRadius: 10,
                            //   height: 50,
                            //   width: MediaQuery.of(context).size.width / 1.3,
                            // ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingtState,
                              builder: (context) => ButtonSign(
                                text: 'Login',
                                ontap: () {
                                  print(emailController.text);

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
                                    color: AppColor.lightGray,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: const Text("  or sign in with  ",
                                      style: TextStyle(
                                          color: AppColor.lightGray,
                                          fontSize: 19)),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 2.0,
                                    color: AppColor.lightGray,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ////   icon facebook and gmail
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 37,
                                  // height: 100,
                                  child: Image.asset(
                                    'assets/images/facebook.png',
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 35,
                                  // height: 40,
                                  child:
                                      Image.asset('assets/images/google.png'),
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
