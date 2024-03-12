import 'package:flutter/material.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:get/get.dart';

class BuildButton extends StatefulWidget {
  BuildButton(
      {super.key,
      required this.text,
      this.bgColor,
      this.textStyle,
      this.onTap,
      this.isLoading,
      required this.duration,
      required this.curve});
  final String text;
  Color? bgColor;
  TextStyle? textStyle;
  VoidCallback? onTap;
  bool? isLoading;
  final Duration duration;
  final Curve curve;

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          height: 50,
          width: Get.width * 0.85,
          decoration: BoxDecoration(
            color: widget.bgColor ?? AppColors.main,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: widget.isLoading == true
                ? const CircularProgressIndicator()
                : Text(widget.text,
                    style: TxtStyle.button.copyWith(color: AppColors.white)),
          ),
        ),
      ),
    );
  }
}
