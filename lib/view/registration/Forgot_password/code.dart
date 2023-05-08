import 'dart:async';

import 'package:app_final/core/style/my_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/components/button_registration.dart';
import '../../../core/style/my_style.dart';


class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: scaffoldKey,
      body: SingleChildScrollView(


        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Image.asset('assets/images/password.png', height: 200)),
                const SizedBox(height: 10),
                // Container(
                //   height: MediaQuery.of(context).size.height / 3,
                //   child: FlareActor(
                //     "assets/otp.flr",
                //     animation: "otp",
                //     fit: BoxFit.fitHeight,
                //     alignment: Alignment.center,
                //   ),
                // ),
                SizedBox(height: 8),
                Text(
                  'Forgot your password?',
                  style: TextLoginButton,
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your registered email below to receive password reset instruction',
                  style: hintStyle,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal:10),
                      child: PinCodeTextField(
                        
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,

                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length! < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                           borderRadius: BorderRadius.circular(20),

                          fieldHeight: 60,
                          fieldWidth: 60,
                          activeColor: Colors.white,
                          disabledColor:Colors.white ,
                         borderWidth: 3,
                          

                          selectedFillColor: Colors.white,
                         selectedColor: AppColor.greenDark,
                           inactiveColor: Colors.white,
                           inactiveFillColor: Colors.white,
                          // activeFillColor:
                          //     hasError ? Colors.orange : Colors.white,
                          activeFillColor: Colors.white,
                        ),


                        cursorColor: Colors.black,

                        animationDuration: Duration(milliseconds: 300),
                        textStyle: TextStyle(fontSize: 20, height: 1.6,color: Colors.grey,),
                        // backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                      children: [
                        TextSpan(
                            text: " RESEND",
                            recognizer: onTapRecognizer,
                            style: TextStyle(
                                color: Color(0xFF91D3B3),
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ]),
                ),
                SizedBox(
                  height: 14,
                ),

                ButtonSign(
                  text: 'Verify Code',
                  ontap: () {
                    // print(emailController?.text);

                    formKey.currentState?.validate();
                    // conditions for validating
                    if (currentText.length != 6 ||
                        currentText != "towtow") {
                      errorController.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() {
                        hasError = true;
                      });
                    } else {
                      setState(() {
                        hasError = false;
                        // scaffoldKey.currentState!.showSnackBa(SnackBar(
                        //   content: Text("Aye!!"),
                        //   duration: Duration(seconds: 2),
                        // ));
                      });
                    }
                  },
                ),                SizedBox(
                  height: 16,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: Text("Clear"),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    ),
                    TextButton(
                      child: Text("Set Text"),
                      onPressed: () {
                        textEditingController.text = "123456";
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
