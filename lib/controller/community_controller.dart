import 'package:get/get.dart';

class CommunityController extends GetxController {
  var status = true.obs;

  void toggleTabs() {
    status.value = !status.value;
  }
}
