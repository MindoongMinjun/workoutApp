import 'package:flutter/material.dart';
import 'package:workout_routine/constants/sizes.dart';
import 'package:workout_routine/feature/widgets/input_dialog.dart';

class InputWorkoutInfoScreen extends StatefulWidget {
  const InputWorkoutInfoScreen({super.key});

  @override
  State<InputWorkoutInfoScreen> createState() => _InputWorkoutInfoState();
}

class _InputWorkoutInfoState extends State<InputWorkoutInfoScreen> {
  List<Widget> sets = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          title: const Text(
            'Make your Sets',
            style: TextStyle(
              fontSize: Sizes.size32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: ListView.separated(
          itemCount: sets.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            for (var set in sets) {
              return set;
            }
            return null;
          },
        ),
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const InputDialog()).then(
              (value) => setState(() {}),
            );
          },
          child: const Icon(
            Icons.add,
            size: Sizes.size72,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          height: Sizes.size80,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size12),
              ),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size40,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
