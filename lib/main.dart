import 'package:flutter/material.dart';
import 'package:ipgeofinder/presentation/theme/colors.dart';
import 'presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      title: 'ipgeofinder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kMainColor,
          secondary: kSecondColor,
        ),
      ),
      home: HomePage(),
    );
  }
}
