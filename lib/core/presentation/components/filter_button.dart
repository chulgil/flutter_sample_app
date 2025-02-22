import 'package:flutter/material.dart';
import 'package:flutter_sample_app/ui/color_styles.dart';
import 'package:flutter_sample_app/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterButton(this.text, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isSelected ? ColorStyles.primary100 : ColorStyles.white,
      label: Text(
        text,
        style: TextStyles.smallerTextRegular.copyWith(
          color: isSelected ? ColorStyles.white : ColorStyles.primary80,
        ),
      ),
      side: BorderSide(color: ColorStyles.primary100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
