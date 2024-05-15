import 'package:chewie/chewie.dart';
import 'package:e_course_flutter/controller/course_video_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CourseVideoContent extends GetView<CourseVideoController> {
  const CourseVideoContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Obx(
        () => controller.isShowLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        _videoPlayer(),
                        const SizedBox(height: 32),
                        _videoTitle(),
                        _teacherInfo(),
                        const SizedBox(height: 16),
                        _videoDescription(context),
                        const SizedBox(height: 20),
                        // _sendComment(context),
                        // const ShowComment(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  // TitleScreen(title: controller.course.selection),
                  BuildBackButton(top: 24),
                ],
              ),
      )),
    );
  }

  ReadMoreText _videoDescription(BuildContext context) {
    return ReadMoreText(
      controller.courseVideo.description!,
      trimLines: 2,
      trimCollapsedText: S.of(context).readmore,
      style: TxtStyle.text.copyWith(color: const Color(0xFF93989A)),
    );
  }

  Row _teacherInfo() {
    return Row(
      children: [
        Text(
          "@${controller.course.teacher!.username}",
          style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Images.iconCheckMark),
      ],
    );
  }

  Text _videoTitle() =>
      Text(controller.courseVideo.title!, style: TxtStyle.title);

  Obx _videoPlayer() {
    return Obx(() => controller.isShowLoading
        ? const Center(child: CircularProgressIndicator())
        : FutureBuilder(
            future: controller.initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio:
                        controller.videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: controller.chewieController),
                  ),
                );
              } else {
                return Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(controller.course.imageIntroduce!),
                      fit: BoxFit.cover,
                    ),
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }
            },
          ));
  }

//   Widget _sendComment(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(S.of(context).comment, style: TxtStyle.inputStyle),
//         const SizedBox(height: 10),
//         ListTile(
//           contentPadding: const EdgeInsets.all(0),
//           leading: CircleAvatar(
//             backgroundImage:
//                 NetworkImage(context.read<SettingCubit>().state.user.photoUrl!),
//           ),
//           title: BuildTextField(
//             controller: commentController,
//             hintText: S.of(context).writeComment,
//             func: (value) {
//               context.read<CourseVideoCubit>().commentChanged(value);
//             },
//           ),
//           trailing: GestureDetector(
//             onTap: () {
//               onPressedSendComment.call();
//             },
//             child: const Icon(Icons.send, color: AppColors.colorFb),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ShowComment extends StatelessWidget {
//   const ShowComment({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CourseVideoCubit, CourseVideoState>(
//       builder: (context, state) {
//         return ListView.builder(
//           itemCount: state.comments.length,
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return UserComment(comment: state.comments[index]);
//           },
//         );
//       },
//     );
//   }
// }

// class UserComment extends StatefulWidget {
//   const UserComment({
//     super.key,
//     required this.comment,
//   });
//   final Comment comment;

//   @override
//   State<UserComment> createState() => _UserCommentState();
// }

// class _UserCommentState extends State<UserComment> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           contentPadding: const EdgeInsets.only(top: 5),
//           leading: FutureBuilder<String?>(
//             future: context
//                 .read<CourseVideoCubit>()
//                 .getPhotoUrlById(widget.comment.userId),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else if (snapshot.hasData && snapshot.data != null) {
//                 return CircleAvatar(
//                   backgroundImage: NetworkImage(snapshot.data!),
//                 );
//               } else {
//                 return const CircleAvatar();
//               }
//             },
//           ),
//           title: FutureBuilder<String?>(
//             future: context
//                 .read<CourseVideoCubit>()
//                 .getUsernameById(widget.comment.userId),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Text("");
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else if (snapshot.hasData && snapshot.data != null) {
//                 return Text(snapshot.data!, style: TxtStyle.hintStyle);
//               } else {
//                 return const Text("");
//               }
//             },
//           ),
//           subtitle: ReadMoreText(
//             widget.comment.title,
//             textAlign: TextAlign.start,
//             trimLength: 80,
//             style: TxtStyle.labelStyle.copyWith(color: const Color(0xFF93989A)),
//           ),
//         ),
//       ],
//     );
//   }
}
