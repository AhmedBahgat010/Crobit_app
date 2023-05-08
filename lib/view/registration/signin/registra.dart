
import 'package:app_final/network/models/user_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/button_registration.dart';
import '../../../../core/style/my_colors.dart';
import '../../../../core/components/DefaultFormField.dart';
import '../../../../core/style/my_style.dart';
import '../../../core/resource/navigator.dart';
import '../../../network/data_resources/local/shared_preferences.dart';
import '../../Home/HomeLayout.dart';
import '../Login/login.dart';
import 'cubit/States.dart';
import 'cubit/cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstnameControlle = TextEditingController();
  TextEditingController lastnameControlle = TextEditingController();
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
          UserModel userModel= RegisterCubit.get(context)!.RegisterModel;
            if (state is RegisterSuccessState) {
              CacheHelper.saveData(
                  key: 'token', value: userModel.token)
                  .then((value) {
                print("userModel.token");
                print("${userModel.token} "+ "ddddddddddddddddddddddddd");
                print("${userModel.email} "+ "ddddddddddddddddddddddddd");
                navigateAndFinished(context, const HomeLayout());
              });
              // if (state.loginModel.status) {

                // Fluttertoast.showToast(
                //     msg: state.loginModel.message,
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.CENTER,
                //     timeInSecForIosWeb: 5,
                //     backgroundColor: Colors.green,
                //     textColor: Colors.white,
                //     fontSize: 16.0);
              // } else {
                // Fluttertoast.showToast(
                //     msg: state.loginModel.message,
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.CENTER,
                //     timeInSecForIosWeb: 5,
                //     backgroundColor: Colors.red,
                //     textColor: Colors.white,
                //     fontSize: 16.0);
              // }
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              backgroundColor: AppColor.white,
              body: SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: RegisterCubit.get(context)?.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height / 10,
                              // ),
                              Center(
                                  child: Image.asset('assets/images/login.png',
                                      height: 200)),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Sign Up', style: loginStyle),

                              Text('Create an account to continue',
                                  style: grayText),
                              SizedBox(
                                height: 30,
                              ),

                              DefaultFormField(
                                hintText: "First Name",
                                labelText: "First Name",
                                prefixIcon: Icons.person,
                                controller: firstnameControlle,
                                validator: (v) {
                                  if (v.isEmpty) {
                                    return "Name is Required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              DefaultFormField(
                                hintText: "Last Mame",
                                labelText: "Last Mame",
                                prefixIcon: Icons.person,
                                controller: lastnameControlle,
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
                                prefixIcon: Icons.email,
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
                                prefixIcon: Icons.phone,
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
                                prefixIcon: Icons.lock,
                                controller: passwordControlle,
                                validator: (v) {
                                  if (v.length < 5) {
                                    return "Password is Required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),

                              DefaultFormField(
                                hintText: "Confirm Password",
                                labelText: "Confirm Password",
                                prefixIcon: Icons.lock,
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
                                builder: (context) => ButtonSign(
                                  text: 'Sign up',
                                  ontap: () {
                                    // print(emailController?.text);

                                    RegisterCubit.get(context)?.userRegister(
                                        email: emailController.text,
                                        password: passwordControlle.text,
                                        name: firstnameControlle.text +
                                            lastnameControlle.text,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an account? ',
                                      style: grayText),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return LoginScreen();
                                          },
                                        ));
                                      },
                                      child: Text('Sign in', style: TextLoginButton)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
