import 'package:flutter/material.dart';

class CardPerson extends StatefulWidget {
  const CardPerson({super.key});

  @override
  State<CardPerson> createState() => _CardPersonState();
}

class _CardPersonState extends State<CardPerson> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text("data")
        ],
      ),
    );
  }
}