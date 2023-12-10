import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAlign extends StatefulWidget {
  const CustomAlign({super.key});

  @override
  State<CustomAlign> createState() => _CustomAlignState();
}

final Uri _url = Uri.parse('https://www.google.com.br');

class _CustomAlignState extends State<CustomAlign> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: _launchURL,
        child: const Text(
          'Política de Privacidade',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
