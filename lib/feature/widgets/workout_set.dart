// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WorkoutSet extends StatelessWidget {
  final String name;
  final double weight;
  final int times;
  final int set;

  const WorkoutSet({
    Key? key,
    required this.name,
    required this.weight,
    required this.times,
    required this.set,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          '$weight',
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          '$times',
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          '$set',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
