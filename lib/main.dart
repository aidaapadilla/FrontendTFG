import 'package:flutter/material.dart';
import 'package:frontend_tfg/views/datatable.dart';
import 'package:frontend_tfg/views/settings.dart';
import 'package:frontend_tfg/views/students.dart';
import 'package:frontend_tfg/views/register.dart';
import 'views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataTableExampleApp(),
    );
  }
}
