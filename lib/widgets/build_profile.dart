import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProfile extends StatelessWidget {
  const BuildProfile({
    this.color,
    super.key,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const user = User(
        uid: '',
        displayName: 'HydraCoder',
        email: 'ngodat.it213@gmail.com',
        photoUrl:
            'https://scontent.fsgn1-1.fna.fbcdn.net/v/t39.30808-1/431748094_1579360056191638_9162859787187610457_n.jpg?stp=dst-jpg_p240x240&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=QWiVaDipxmEAX-TQLew&_nc_ht=scontent.fsgn1-1.fna&oh=00_AfCmwQJYbOwJzT-X9JHXVsbGziMmySE4Q3EBMVTPXw_8VA&oe=65F6971E');
    return GestureDetector(
      onTap: () {
        Get.toNamed(ManagerRoutes.profileScreen);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(backgroundImage: NetworkImage(user.photoUrl!)),
        title: Text(user.displayName!,
            style: TxtStyle.h3.copyWith(color: color ?? AppColors.white)),
        subtitle: Text(user.email ?? "",
            style:
                TxtStyle.labelStyle.copyWith(color: color ?? AppColors.white)),
      ),
    );
  }
}
