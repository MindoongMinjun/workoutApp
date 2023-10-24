import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_routine/constants/gaps.dart';
import 'package:workout_routine/constants/sizes.dart';
import 'package:workout_routine/feature/widgets/save_button.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({super.key});

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _timesEditingController = TextEditingController();
  final TextEditingController _setEditingController = TextEditingController();
  final TextEditingController _weightEditingController =
      TextEditingController();

  bool disabled = true;
  late String name;
  late int times;
  late int set;
  late double weight;

  void _onSaveTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        final SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('name', name);
        await pref.setInt('times', times);
        await pref.setInt('set', set);
        await pref.setDouble('weight', weight);
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _setEditingController.dispose();
    _timesEditingController.dispose();
    _weightEditingController.dispose();
    super.dispose();
  }

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
              TextFormField(
                decoration: InputDecoration(
                  hintText: '이름',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                controller: _nameEditingController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '문자를 입력해주세요.';
                  } else if (value is String) {
                    return null;
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    name = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: InputDecoration(
                  hintText: '횟수',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                controller: _timesEditingController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '숫자를 입력해주세요.';
                  } else if (value is int) {
                    return null;
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    times = int.parse(newValue);
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: InputDecoration(
                  hintText: '세트',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                controller: _setEditingController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '숫자를 입력해주세요.';
                  } else if (value is int) {
                    return null;
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    set = int.parse(newValue);
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: InputDecoration(
                  hintText: '무게',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                controller: _weightEditingController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '숫자를 입력해주세요.';
                  } else if (value is double) {
                    return null;
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    weight = double.parse(newValue);
                  }
                },
              ),
              Gaps.v20,
              GestureDetector(
                onTap: _onSaveTap,
                child: const SaveButton(disabled: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
