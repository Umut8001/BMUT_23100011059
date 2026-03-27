import 'package:flutter/material.dart';
import 'package:qr_yoklama_mobil/pages/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEÜ QR YOKLAMA',
      home: SignInPage(),
    );
  }
}
