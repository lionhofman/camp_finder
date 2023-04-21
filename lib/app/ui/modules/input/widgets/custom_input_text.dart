import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final bool? showPass;
  final Function(bool)? setShowPass;
  final String? errorText;
  final bool isValid;
  final Function(String)? onChange;
  final Function()? clearField;
  final String? fieldText;
  const CustomInputText({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscure,
    this.showPass,
    this.setShowPass,
    this.errorText,
    required this.isValid,
    this.onChange,
    this.clearField,
    this.fieldText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: TextField(
        onChanged: (value) {
          onChange != null ? onChange!(value) : null;
        },
        controller: controller,
        obscureText: isObscure
            ? showPass != null
                ? showPass!
                : false
            : isObscure,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          suffixIcon: Visibility(
            visible: fieldText != null && fieldText!.isNotEmpty,
            child: !isObscure ? suffixIconNormal() : suffixIconsPass(),
          ),
          errorText: !isValid ? errorText : null,
          errorStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFFDB1A2E),
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget suffixIconNormal() => IconButton(
        onPressed: clearField,
        icon: (isValid)
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 16,
              )
            : const Icon(
                Icons.cancel,
                color: Color(0xFF929292),
                size: 16,
              ),
      );

  Widget suffixIconsPass() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Icon(
              showPass != null && showPass!
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Color(0xFF929292),
              size: 16,
            ),
            onTap: () {
              setShowPass!(!showPass!);
            },
          ),
          const SizedBox(width: 10),
          suffixIconNormal(),
        ],
      );
}
