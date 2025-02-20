import 'package:flutter/material.dart';
import 'package:flutter_sample_app/ui/color_styles.dart';


class BigButton extends StatelessWidget {
  const BigButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.primary100,
      ),
    );
  }
}