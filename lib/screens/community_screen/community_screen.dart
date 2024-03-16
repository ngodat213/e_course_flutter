import 'package:e_course_flutter/controller/community_controller.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityScreen extends GetView<CommunityController> {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const user = User(
        uid: '',
        displayName: 'HydraCoder',
        photoUrl:
            'https://scontent.fsgn1-1.fna.fbcdn.net/v/t39.30808-1/431748094_1579360056191638_9162859787187610457_n.jpg?stp=dst-jpg_p240x240&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=QWiVaDipxmEAX-TQLew&_nc_ht=scontent.fsgn1-1.fna&oh=00_AfCmwQJYbOwJzT-X9JHXVsbGziMmySE4Q3EBMVTPXw_8VA&oe=65F6971E');
    const listCategory = [
      'All',
      'C++',
      'C#',
      'Python',
      'Javascript',
      'HTML',
      'Android',
      'Flutter',
    ];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _tabbarCommunity(),
              _communityCategory(listCategory),
              _listViewCommunity(user),
              _listViewCommunity(user),
              _listViewCommunity(user),
            ],
          ),
        ),
      )),
    );
  }

  Container _communityCategory(List<String> listCategory) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      height: Get.height * 0.04,
      child: ListView.builder(
        itemCount: listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // widget.onPressedExam.call(quizs[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                listCategory[index],
                style: TxtStyle.inputStyle.copyWith(
                  fontWeight: index == 0 ? FontWeight.w600 : FontWeight.w500,
                  color: index == 0 ? AppColors.main : AppColors.input,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column _listViewCommunity(User user) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(25, 15, 25, 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl!),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: Get.width * 0.74,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName!,
                      style: TxtStyle.button,
                    ),
                    Text(
                      'How to Getx working in Flutter',
                      style: TxtStyle.h3,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      'Think from a software developer’s point of view. When the bulb turns on, the UI of the bulb changes from a non-illuminated state to an illuminated state. Though physically we do not see the bulb being recreated or rebuilt, the UI would build from scratch if that were the situation on mobile software with reactive state management.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      width: Get.width * 0.74,
                      height: Get.height * 0.2,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://scontent.fsgn1-1.fna.fbcdn.net/v/t39.30808-1/431748094_1579360056191638_9162859787187610457_n.jpg?stp=dst-jpg_p240x240&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=QWiVaDipxmEAX-TQLew&_nc_ht=scontent.fsgn1-1.fna&oh=00_AfCmwQJYbOwJzT-X9JHXVsbGziMmySE4Q3EBMVTPXw_8VA&oe=65F6971E',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: Get.height * 0.03,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.arrow_drop_up),
                              const Text('1111'),
                              const SizedBox(width: 5),
                              Container(
                                height: 20,
                                width: 1,
                                decoration:
                                    const BoxDecoration(color: AppColors.label),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                        SizedBox(width: Get.width * 0.05),
                        Container(
                          height: Get.height * 0.03,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.chat_outlined,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text('11 Comments')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: const Divider(
            height: 1,
          ),
        )
      ],
    );
  }

  Container _header() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good morning!', style: TxtStyle.p),
          Text('Community', style: TxtStyle.title),
        ],
      ),
    );
  }

  Center _tabbarCommunity() {
    return Center(
      child: Container(
        width: Get.width * 0.90,
        height: Get.width * 0.1,
        margin: const EdgeInsets.only(),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.main),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => controller.toggleTabs(),
              child: Container(
                width: Get.width * 0.43,
                height: Get.height * 0.8,
                decoration: controller.status.value
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      )
                    : const BoxDecoration(),
                child: Center(
                  child: Text(
                    'Blog',
                    style: TxtStyle.button.copyWith(
                        color: controller.status.value
                            ? AppColors.main
                            : AppColors.white),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => controller.toggleTabs(),
              child: Container(
                width: Get.width * 0.43,
                height: Get.height * 0.8,
                decoration: controller.status.value
                    ? const BoxDecoration()
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                child: Center(
                  child: Text(
                    'QA',
                    style: TxtStyle.button.copyWith(
                        color: controller.status.value
                            ? AppColors.white
                            : AppColors.main),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
