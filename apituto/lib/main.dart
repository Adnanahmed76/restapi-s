import 'package:apituto/pages/complex_jso_prac.dart';
import 'package:apituto/pages/pracice_get_apis.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: ComplexJsoPrac()
    );
  }
}
