import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.maxLength,
    required this.keyboardType,
    required this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
