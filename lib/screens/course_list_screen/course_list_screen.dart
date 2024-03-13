// import 'package:e_course_flutter/generated/l10n.dart';
// import 'package:e_course_flutter/themes/colors.dart';
// import 'package:e_course_flutter/themes/text_styles.dart';
// import 'package:e_course_flutter/widgets/back_button.dart';
// import 'package:e_course_flutter/widgets/course_card_listview.dart';
// import 'package:e_course_flutter/widgets/title_screen.dart';
// import 'package:flutter/material.dart';

// class CourseListScreen extends StatefulWidget {
//   const CourseListScreen({super.key});

//   @override
//   State<CourseListScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<CourseListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Stack(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 70),
//                   Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 25, vertical: 25),
//                     decoration: BoxDecoration(
//                       boxShadow: AppColors.shadow,
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: TextFormField(
//                       // onChanged: (value) => _runFilter(value),
//                       decoration: InputDecoration(
//                         contentPadding:
//                             const EdgeInsets.symmetric(vertical: 17),
//                         prefixIcon: const Icon(Icons.search),
//                         hintText: S.of(context).searchTitle,
//                         hintStyle: TxtStyle.description,
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 25),
//                     child: ListView.builder(
//                       itemCount: found.length,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             // context
//                             //     .read<CourseDetailCubit>()
//                             //     .courseChanged(found[index]);
//                             // context
//                             //     .read<CourseDetailCubit>()
//                             //     .isFullChanged(true);
//                             // BaseNavigation.push(context,
//                             //     routeName: ManagerRoutes.courseDetailScreen);
//                           },
//                           child: CourseCardListView(found[index]),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 70),
//                 ],
//               ),
//               BuildBackButton(top: 24),
//               TitleScreen(title: S.of(context).course),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
