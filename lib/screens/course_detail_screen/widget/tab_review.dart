import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';

class TabReview extends StatefulWidget {
  const TabReview({super.key});

  @override
  State<TabReview> createState() => _TabReviewState();
}

class _TabReviewState extends State<TabReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 28),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedBack(),
            FeedBack(),
            FeedBack(),
          ],
        ),
      ),
    );
  }
}

class FeedBack extends StatelessWidget {
  const FeedBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
                child: Image.network(
                    'https://scontent.fsgn1-1.fna.fbcdn.net/v/t39.30808-1/431748094_1579360056191638_9162859787187610457_n.jpg?stp=dst-jpg_p240x240&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=QWiVaDipxmEAX-TQLew&_nc_ht=scontent.fsgn1-1.fna&oh=00_AfCmwQJYbOwJzT-X9JHXVsbGziMmySE4Q3EBMVTPXw_8VA&oe=65F6971E')),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hydra Coder',
                  style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    const SizedBox(width: 8),
                    Text('• 12 Feb 2022', style: TxtStyle.time),
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'The explanation is very easy to understand, really cool, understandable and.',
          style: TxtStyle.labelStyle,
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
