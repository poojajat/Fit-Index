import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF0A0F33),foregroundColor: Colors.white),
        scaffoldBackgroundColor: Color(0xFF0A0F33),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))


      ),
      home: InputPage(),
    );
  }
}



