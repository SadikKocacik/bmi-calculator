import 'package:flutter/material.dart';
import 'input_page.dart';
// import 'results_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF16193D),
        // colorScheme:
        // ColorScheme.fromSwatch().copyWith(primary: Color(0XFF16193D))
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}
