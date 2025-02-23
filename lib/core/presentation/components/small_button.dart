import 'package:flutter/material.dart';
import 'package:flutter_sample_app/ui/color_styles.dart';
import 'package:flutter_sample_app/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final void Function() onPressed;

  const SmallButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = ColorStyles.primaryColor,
    this.textStyle = TextStyles.normalTextBold,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : widget.color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: widget.textStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
