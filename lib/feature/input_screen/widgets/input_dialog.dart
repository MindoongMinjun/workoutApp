import 'package:flutter/material.dart';
import 'package:workout_routine/constants/gaps.dart';
import 'package:workout_routine/constants/sizes.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({super.key});

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '이름',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size24,
                ),
              ),
              TextFormField(
                controller: _textEditingController,
              ),
              Gaps.v16,
              const Text(
                '횟수',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size24,
                ),
              ),
              TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value is! int) return "숫자 입력";
                  return null;
                },
              ),
              Gaps.v16,
              const Text(
                '세트',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size24,
                ),
              ),
              TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value is! int) return "숫자 입력";
                  return null;
                },
              ),
              Gaps.v16,
              const Text(
                '무게',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size24,
                ),
              ),
              TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value is! int) return "숫자 입력";
                  return null;
                },
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.white70),
                    ),
                  ),
                  child: const Text(
                    '등록',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
