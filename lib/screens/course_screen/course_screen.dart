import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> courses = [
      const Course(
        uid: "1",
        teacherId: "teacher1",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 1",
        description: "Description for Course 1",
        time: "10:00 AM - 12:00 PM",
        lessons: ["Lesson 1", "Lesson 2", "Lesson 3"],
        category: "Category 1",
        rating: 4.5,
        feedbacks: ["Feedback 1", "Feedback 2"],
        register: 100,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
      const Course(
        uid: "2",
        teacherId: "teacher2",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 2",
        description: "Description for Course 2",
        time: "2:00 PM - 4:00 PM",
        lessons: ["Lesson 1", "Lesson 2"],
        category: "Category 2",
        rating: 4.2,
        feedbacks: ["Feedback 1", "Feedback 2", "Feedback 3"],
        register: 120,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
      const Course(
        uid: "3",
        teacherId: "teacher3",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 3",
        description: "Description for Course 3",
        time: "6:00 PM - 8:00 PM",
        lessons: ["Lesson 1", "Lesson 2", "Lesson 3", "Lesson 4"],
        category: "Category 3",
        rating: 4.8,
        feedbacks: ["Feedback 1"],
        register: 90,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
      const Course(
        uid: "4",
        teacherId: "teacher4",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 4",
        description: "Description for Course 4",
        time: "8:00 AM - 10:00 AM",
        lessons: ["Lesson 1"],
        category: "Category 4",
        rating: 4.0,
        feedbacks: [],
        register: 80,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
      const Course(
        uid: "4",
        teacherId: "teacher4",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 4",
        description: "Description for Course 4",
        time: "8:00 AM - 10:00 AM",
        lessons: ["Lesson 1"],
        category: "Category 4",
        rating: 4.0,
        feedbacks: [],
        register: 80,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
      const Course(
        uid: "4",
        teacherId: "teacher4",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 4",
        description: "Description for Course 4",
        time: "8:00 AM - 10:00 AM",
        lessons: ["Lesson 1"],
        category: "Category 4",
        rating: 4.0,
        feedbacks: [],
        register: 80,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
      const Course(
        uid: "4",
        teacherId: "teacher4",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 4",
        description: "Description for Course 4",
        time: "8:00 AM - 10:00 AM",
        lessons: ["Lesson 1"],
        category: "Category 4",
        rating: 4.0,
        feedbacks: [],
        register: 80,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
      const Course(
        uid: "4",
        teacherId: "teacher4",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 4",
        description: "Description for Course 4",
        time: "8:00 AM - 10:00 AM",
        lessons: ["Lesson 1"],
        category: "Category 4",
        rating: 4.0,
        feedbacks: [],
        register: 80,
        videos:
            "https://res.cloudinary.com/duhncgkpo/video/upload/v1694794071/video_course/grtn1yylbc2xic9euxwa.mp4",
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    decoration: BoxDecoration(
                      boxShadow: AppColors.shadow,
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextFormField(
                      // onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 17),
                        prefixIcon: const Icon(Icons.search),
                        hintText: S.of(context).searchTitle,
                        hintStyle: TxtStyle.description,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: GridView.custom(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.6,
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: courses.length,
                        (context, index) => GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                child: Image.network(
                                  courses[index].courseImage,
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Skeleton(radius: 8);
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Skeleton(radius: 8);
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      courses[index].title,
                                      style: TxtStyle.text
                                          .copyWith(color: AppColors.white),
                                    ),
                                    Text('Hydra', style: TxtStyle.p),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
              TitleScreen(title: S.of(context).course),
            ],
          ),
        ),
      ),
    );
  }
}
