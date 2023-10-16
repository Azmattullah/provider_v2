import 'package:flutter/material.dart';
import 'package:provider_v2/productApi/home_page2.dart';
// import 'package:provider_v2/sampleApi/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Api Using Provider',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: Scaffold(appBar: AppBar(),
      body: MyHomePage2(),
      ),
    );
  }
}
