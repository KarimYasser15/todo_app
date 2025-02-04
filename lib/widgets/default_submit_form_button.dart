import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';

class DefaultSubmitFormButton extends StatelessWidget {
  DefaultSubmitFormButton({required this.onPressed, required this.label});

  String label;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primaryBlue, fixedSize: Size(255.w, 52.h)),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ColorsManager.white, fontWeight: FontWeight.normal),
      ),
    );
  }
}
