import 'package:app_final/core/style/my_colors.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  const DefaultFormField(
      {Key? key,
        this.labelText,
        this.hintText,
        this.controller,
        this.validator,
        this.onFieldSubmitted,
        this.isPassword = false,
        this.keyboardType,
        this.prefixIcon,
      })
      : super(key: key);

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: widget.isPassword ? _isObscure : false,
        cursorColor: AppColor.greenDark,
        controller: widget.controller,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        style: const TextStyle(color:AppColor.gray, fontSize: 20,height: 1.5),
        keyboardType:widget.keyboardType,
        decoration: InputDecoration(

          suffixIcon: widget.isPassword
              ? IconButton(
              splashRadius: 20,
              icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color:AppColor.gray),
              onPressed: () => setState(() => _isObscure = !_isObscure))
              : null,
          filled: true,

          prefixIcon: widget.prefixIcon!=null? Icon(widget.prefixIcon):null,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          fillColor:AppColor.white,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: AppColor.gray, fontSize: 22),

          hintStyle: const TextStyle(color: AppColor.gray, fontSize: 20),

          // border: OutlineInputBorder(),

      ),
      ),
    );
  }
}
