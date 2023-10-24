import 'package:flutter/material.dart';
import 'package:workout_routine/constants/sizes.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size20),
        border: Border.all(
          color: Colors.white30,
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'chest',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
