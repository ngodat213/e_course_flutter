import 'package:e_course_flutter/controller/community_controller.dart';
import 'package:get/get.dart';

class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommunityController());
  }
}
