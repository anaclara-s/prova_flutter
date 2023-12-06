import 'package:flutter/material.dart';

import 'constants.dart';

class CustomElevatedButton extends StatefulWidget {
  final void Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: kElevatedButtomColor,
      minimumSize: const Size(180, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );

    return ElevatedButton(
      style: style,
      onPressed: widget.onPressed,
      child: const Text(
        'Entrar',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
