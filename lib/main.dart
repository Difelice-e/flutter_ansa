// import 'dart:js';

import 'package:flutter/material.dart';

import 'package:flutter_ansa/components/app_scaffold.dart';
import 'package:flutter_ansa/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(home: HomePage());
  }
}
