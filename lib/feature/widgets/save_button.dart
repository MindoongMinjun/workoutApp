import 'package:flutter/material.dart';
import 'package:workout_routine/constants/sizes.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size5),
            color: disabled ? Theme.of(context).primaryColor : Colors.black),
        duration: const Duration(milliseconds: 300),
        child: Text(
          'save',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: disabled ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
