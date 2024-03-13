import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/screens/home_screen/widget/card_course.dart';
import 'package:e_course_flutter/screens/home_screen/widget/card_exam.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<HomeScreen> {
  final user = const User(
      uid: '',
      displayName: 'HydraCoder',
      photoUrl:
          'https://scontent.fsgn1-1.fna.fbcdn.net/v/t39.30808-1/431748094_1579360056191638_9162859787187610457_n.jpg?stp=dst-jpg_p240x240&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=QWiVaDipxmEAX-TQLew&_nc_ht=scontent.fsgn1-1.fna&oh=00_AfCmwQJYbOwJzT-X9JHXVsbGziMmySE4Q3EBMVTPXw_8VA&oe=65F6971E');

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
  ];

  List<Quiz> quizs = [
    const Quiz(
      uid: '1',
      title: 'Introduction to Programming',
      image: 'intro_programming.jpg',
      description:
          'Learn the basics of programming with this introductory course.',
      type: 'Beginner',
      lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3'],
    ),
    const Quiz(
      uid: '2',
      title: 'Data Structures and Algorithms',
      image: 'data_structures.jpg',
      description: 'Explore fundamental data structures and algorithms.',
      type: 'Intermediate',
      lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3', 'Lesson 4'],
    ),
    const Quiz(
      uid: '3',
      title: 'Web Development',
      image: 'web_development.jpg',
      description:
          'Learn to build web applications with HTML, CSS, and JavaScript.',
      type: 'Intermediate',
      lessons: ['HTML Basics', 'CSS Styling', 'JavaScript Fundamentals'],
    ),
    const Quiz(
      uid: '4',
      title: 'Machine Learning',
      image: 'machine_learning.jpg',
      description:
          'Explore the world of machine learning and artificial intelligence.',
      type: 'Advanced',
      lessons: [
        'Introduction to ML',
        'Supervised Learning',
        'Unsupervised Learning',
        'Deep Learning'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeUser(user),
              _courseSilder(courses),
              _dotIndicator(3),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _gridviewCourseTitle(context),
                    _gridviewCourse(context, courses),
                    _listExams(context, quizs),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listExams(BuildContext context, List<Quiz> quizs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(S.of(context).todayTest, style: TxtStyle.title),
        const SizedBox(height: 8),
        Text(S.of(context).todayTestTitle, style: TxtStyle.hintStyle),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: quizs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // widget.onPressedExam.call(quizs[index]);
                },
                child: CardExam(
                  quiz: quizs[index],
                  image: 'lib/res/images/read_image$index.svg',
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _gridviewCourse(BuildContext context, List<Course> courses) {
    return Column(
      children: [
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
            childCount: courses.length < 4 ? courses.length : 4,
            (context, index) => GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      courses[index].courseImage,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                      loadingBuilder: (BuildContext context, Widget child,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courses[index].title,
                          style: TxtStyle.text.copyWith(color: AppColors.white),
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
      ],
    );
  }

  Widget _gridviewCourseTitle(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).populraCourse, style: TxtStyle.title),
            GestureDetector(
              onTap: () {},
              child: Text(
                S.of(context).all,
                style: TxtStyle.p.copyWith(color: AppColors.main),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _courseSilder(List<Course> courses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: courses
              .map((e) => GestureDetector(onTap: () {}, child: CardSlider(e)))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {},
          ),
        ),
      ],
    );
  }

  Widget _dotIndicator(int index) {
    return Center(
      child: DotsIndicator(
        dotsCount: 4,
        position: index,
        decorator: DotsDecorator(
          color: AppColors.grey,
          activeColor: AppColors.main,
          size: const Size.square(5),
          activeSize: const Size(5, 5),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget _welcomeUser(User user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${S.of(context).hi}, ${user.displayName}',
              style: TxtStyle.title),
          const SizedBox(height: 2),
          Text(S.of(context).progressTitle, style: TxtStyle.hintStyle),
        ],
      ),
    );
  }
}
