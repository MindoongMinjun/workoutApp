import 'package:flutter/material.dart';

class WorkoutSet extends StatelessWidget {
  const WorkoutSet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          '벤치프레스',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '70kg',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '5 reps',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '5 sets',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
