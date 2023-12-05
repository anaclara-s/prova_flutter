import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? text;

  const CustomTextFormField(
      {super.key,
      required this.maxLength,
      required this.keyboardType,
      required this.prefixIcon,
      required this.text});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
                style: TextStyle(color: kTextFormFieldColor, fontSize: 18),
              ),
            ),
          ],
        ),
        TextFormField(
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
        ),
      ],
    );
  }
}
