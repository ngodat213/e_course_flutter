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
        username: 'HydraCoder',
        email: 'ngodat.it213@gmail.com',
        photoUrl:
            'https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-6/431748094_1579360056191638_9162859787187610457_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=QWiVaDipxmEAX-ODRIa&_nc_ht=scontent.fsgn2-5.fna&oh=00_AfBkQnn2dfcMcWY3-O2AdqxODTO7Zjsj7rw3FIdg1tmesw&oe=65F6BDA0');
    return GestureDetector(
      onTap: () {
        Get.toNamed(ManagerRoutes.profileScreen);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(backgroundImage: NetworkImage(user.photoUrl!)),
        title: Text(user.username!,
            style: TxtStyle.h3.copyWith(color: color ?? AppColors.white)),
        subtitle: Text(user.email ?? "",
            style:
                TxtStyle.labelStyle.copyWith(color: color ?? AppColors.white)),
      ),
    );
  }
}
