import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? text;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final bool? autofocus;
  final Widget? label;
  final TextStyle? labelStyle;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.maxLength,
    this.keyboardType,
    this.prefixIcon,
    this.text,
    required this.controller,
    this.inputFormatters,
    this.validator,
    this.onFieldSubmitted,
    this.autovalidateMode,
    this.autofocus,
    this.label,
    this.labelStyle,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

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
                style:
                    const TextStyle(color: kTextFormFieldColor, fontSize: 18),
              ),
            ),
          ],
        ),
        TextFormField(
          autofocus: widget.autofocus ?? false,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            label: widget.label,
            labelStyle: widget.labelStyle,
            prefixIcon: widget.prefixIcon,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
