import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? text;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      required this.maxLength,
      required this.keyboardType,
      required this.prefixIcon,
      required this.text,
      required this.controller,
      this.inputFormatters,
      required this.validator});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.text ?? "",
                style: const TextStyle(color: kTextFormFieldColor, fontSize: 18),
              ),
            ),
          ],
        ),
        TextFormField(
          controller: widget.controller,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            setState(() {
              isPasswordValid = (value.length <= 2);
            });
          },
        ),
      ],
    );
  }
}
