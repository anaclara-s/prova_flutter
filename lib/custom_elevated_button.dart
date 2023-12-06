import 'package:flutter/material.dart';

import 'constants.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({super.key});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 20),
      backgroundColor: kElevatedButtomColor,
      minimumSize: Size(180, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );

    return ElevatedButton(
      child: Text(
        'Entrar',
        style: TextStyle(color: Colors.white),
      ),
      style: style,
      onPressed: () {},
    );
  }
}
