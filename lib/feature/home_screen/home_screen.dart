import 'package:flutter/material.dart';
import 'package:workout_routine/constants/sizes.dart';
import 'package:workout_routine/feature/home_screen/widgets/workout.dart';
import 'package:workout_routine/feature/input_screen/input_workout_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> workoutList = [];

  void _deleteWorkout() {
    setState(() {});
  }

  void _createWorkout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const InputWorkoutInfo(),
      ),
    ).then(
      (value) => setState(() {
        workoutList.add(
          const Workout(),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your Routines',
          style: TextStyle(
            fontSize: Sizes.size32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
            vertical: Sizes.size20,
          ),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            mainAxisSpacing: Sizes.size14,
            crossAxisSpacing: Sizes.size14,
          ),
          children: [
            for (var workout in workoutList) workout,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          _createWorkout(context);
        },
        child: const Icon(
          Icons.add,
          size: Sizes.size72,
        ),
      ),
    );
  }
}
