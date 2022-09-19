import 'package:flutter/material.dart';
import 'package:dh_case/view/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dh Case',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Navigator starst with search page
      home: const SearchPage(),
    );
  }
}
