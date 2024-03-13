import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenContentSkeleton extends StatelessWidget {
  const HomeScreenContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Skeleton(
            width: 80,
          ),
          const SizedBox(height: 8),
          const Skeleton(
            width: 120,
          ),
          const SizedBox(height: 18),
          Skeleton(
            width: MediaQuery.of(context).size.width,
            height: 180,
          ),
          const SizedBox(height: 21),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skeleton(width: 80),
              Skeleton(width: 32),
            ],
          ),
          const SizedBox(height: 8),
          GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.6,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) => const Skeleton(),
            ),
          ),
          const SizedBox(height: 20),
          const Skeleton(
            width: 80,
          ),
          const SizedBox(height: 8),
          const Skeleton(
            width: 120,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Skeleton(width: 160, height: 200),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
