import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  CustomTextFormFild(
      {super.key,
      required this.hint,
      this.suffixIcon,
      this.onTapSuffixIcon,
      this.obscureText = false,
      this.validator,
      this.onChanged,
      this.onEditingComplete,
      this.controller,
      required this.prefixIcon,
      this.filled = false,
      this.enabled = true,
      this.initialValue});
  String hint;
  IconData prefixIcon;
  IconData? suffixIcon;
  VoidCallback? onTapSuffixIcon;
  bool obscureText;
  bool filled;
  bool enabled;
  String? initialValue;

  TextEditingController? controller;
  Function()? onEditingComplete;

  String? Function(String?)? validator;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onEditingComplete: onEditingComplete,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.blue,
          size: 20,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: Colors.blue,
            size: 20,
          ),
          onPressed: onTapSuffixIcon,
        ),
        filled: filled,
        enabled: enabled,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      ),
    );
  }
}
