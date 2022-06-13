import 'package:flutter/material.dart';
import 'package:spotlas_coding_challenge/feature/views/feed/view/feed_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotlas Demo App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const FeedView(),
    );
  }
}
