// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BaseText extends StatefulWidget {
  final String text;
  final TextStyle style;
  TextAlign? textAlign;
  final Duration duration;
  final Curve curve;

  BaseText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
  });

  @override
  _BaseTextState createState() => _BaseTextState();
}

class _BaseTextState extends State<BaseText>
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
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.text,
        style: widget.style,
        textAlign: widget.textAlign ?? TextAlign.start,
      ),
    );
  }
}
