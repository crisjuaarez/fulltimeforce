import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/ui/theme/app_colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      width: double.infinity,
      child: CupertinoButton(
        color: AppColors.primary,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 21,
              ),
        ),
      ),
    );
  }
}
