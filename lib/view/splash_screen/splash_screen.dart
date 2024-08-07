import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      backgroundColor: Color(0xff0C1224),
      body: Center(child: Image.network("https://media1.giphy.com/media/Vx8UvEl6jTEnZX1w1E/200w.gif?cid=6c09b952dizb1q1b88s8j9ioyr0wbjif6kbcscpgcidlz7l2&ep=v1_gifs_search&rid=200w.gif&ct=s")),
    );
  }
}
