import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ReadMoreHtml extends StatefulWidget {
  final String htmlContent;
  final int trimLines;
  final String trimCollapsedText;
  final String trimExpandedText;
  final TextStyle? style;

  const ReadMoreHtml({
    super.key,
    required this.htmlContent,
    this.trimLines = 2,
    required this.trimCollapsedText,
    required this.trimExpandedText,
    this.style,
  });

  @override
  _ReadMoreHtmlState createState() => _ReadMoreHtmlState();
}

class _ReadMoreHtmlState extends State<ReadMoreHtml> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        // Create a TextPainter to measure text height
        final span = TextSpan(
          text: widget.htmlContent,
          style: widget.style,
        );
        final tp = TextPainter(
          text: span,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: size.maxWidth);

        // Check if text overflows
        final isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(
              data: widget.htmlContent,
              style: {
                "body": Style(
                  maxLines: isExpanded ? null : widget.trimLines,
                  textOverflow:
                      isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  color: widget.style?.color,
                  fontSize: widget.style?.fontSize != null
                      ? FontSize(widget.style!.fontSize!)
                      : null,
                ),
              },
            ),
            if (isOverflowing)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded
                      ? widget.trimExpandedText
                      : widget.trimCollapsedText,
                  style: widget.style ?? const TextStyle(color: Colors.blue),
                ),
              ),
          ],
        );
      },
    );
  }
}
