import 'package:flutter/material.dart';
class Simole extends StatefulWidget {
  const Simole({super.key});

  @override
  State<Simole> createState() => _SimoleState();
}

class _SimoleState extends State<Simole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
