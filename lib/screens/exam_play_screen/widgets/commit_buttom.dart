import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommitButton extends StatefulWidget {
  const CommitButton({
    super.key,
  });

  @override
  State<CommitButton> createState() => _CommitButtonState();
}

class _CommitButtonState extends State<CommitButton> {
  void _showDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return const CommitDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 70,
      child: GestureDetector(
        onTap: _showDialog,
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 2, 9, 61),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class CommitDialog extends GetView<ExamPlayController> {
  const CommitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Questions"),
      actions: [
        TextButton(
          onPressed: () => controller.cancelDialog(),
          child: Text("Cancel", style: TxtStyle.text),
        ),
        TextButton(
          onPressed: () => controller.commitDialog(),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(AppColors.main),
          ),
          child: Text("Commit", style: TxtStyle.p),
        )
      ],
      content: SingleChildScrollView(
        child: SizedBox(
          width: 300,
          child: Wrap(
            children: [
              for (int i = 0; i < controller.userChooise.length; i++)
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = i;
                  },
                  child: _OptionSelect(i: i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionSelect extends GetView<ExamPlayController> {
  const _OptionSelect({
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(left: 8, bottom: 6),
      decoration: BoxDecoration(
        color:
            controller.userChooise[i] == -1 ? AppColors.grey : AppColors.main,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text(
        (i + 1).toString(),
        style: TxtStyle.p.copyWith(
          color:
              controller.userChooise[i] == -1 ? Colors.black : AppColors.white,
        ),
      ),
    );
  }
}
