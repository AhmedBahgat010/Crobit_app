import 'package:app_final/view/registration/signin/cubit/States.dart';
import 'package:app_final/view/registration/signin/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/components/button_registration.dart';
import '../../../../core/style/my_colors.dart';
import '../../../../core/components/DefaultFormField.dart';
import '../../../../core/style/my_style.dart';
import '../../../core/resource/navigator.dart';
import '../../../network/data_resources/local/shared_preferences.dart';
import '../../Home/HomeLayout.dart';
import '../Login/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameControlle = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneControlle = TextEditingController();
  TextEditingController passwordControlle = TextEditingController();
  TextEditingController conPasswordControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: SafeArea(
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
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
              appBar: AppBar(),
              backgroundColor: AppColor.white,
              body: ListView(
                children: [
                  Form(
                    key:  RegisterCubit.get(context)?.formKey ,
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
                        //         ))),
                        // Positioned(
                        //   bottom: -250,
                        //   left: -200,
                        //   child: Image.asset(
                        //     'assets/images/Pngtre.png',
                        //     height: 400,
                        //     color: Colors.grey.shade200,
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height / 10,
                              // ),
                              Text('Create Account', style: loginStyle),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 11,
                              ),
                              DefaultFormField(
                                hintText: "Name",
                                labelText: "Name",
                                controller: nameControlle,
                                validator: (v) {
                                  if (v.isEmpty) {
                                    return "Name is Required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),

                              DefaultFormField(
                                hintText: "Email",
                                labelText: "Email",
                                controller: emailController,
                                validator: (v) {
                                  if (v.isEmpty) {
                                    return "Email is Required";
                                  }
                                  return null;
                                },
                              ),
                              DefaultFormField(
                                hintText: "Phone",
                                labelText: "Phone",
                                controller: phoneControlle,
                                validator: (v) {
                                  if (v.isEmpty) {
                                    return "phone is Required";
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 10),
                              DefaultFormField(
                                hintText: "Password",
                                labelText: "Password",
                                isPassword: true,
                                controller: passwordControlle,
                                validator: (v) {
                                  if (v.length < 8) {
                                    return "Password is Required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),

                              DefaultFormField(
                                hintText: "Confirm Password",
                                labelText: "Confirm Password",
                                isPassword: true,
                                controller: conPasswordControlle,
                                validator: (v) {
                                  if (passwordControlle.text !=
                                      conPasswordControlle.text) {
                                    return "Passwords not match";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ConditionalBuilder(
                                condition: state is! RegisterLoadingtState,
                                builder: (context) => ButtonSign (
                                  text: 'Sign up',

                                  ontap: () {
                                    // print(emailController?.text);

                                    RegisterCubit.get(context)?.userRegister(
                                        email: emailController.text,
                                        password: passwordControlle.text,
                                        name: nameControlle.text,
                                        phone: phoneControlle.text);
                                  },
                                ),
                                fallback: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ));
                                },
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Already have an account? ',
                                          style: grayText),
                                      Text('Sign in', style: TextLoginButton),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
