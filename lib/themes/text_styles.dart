import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_course_flutter/themes/colors.dart';

class TxtStyle {
  TxtStyle._();

  static TextStyle p = GoogleFonts.openSans(
      fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grey);

  static TextStyle labelStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.label);

  static TextStyle lineThrough = GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.label,
      decoration: TextDecoration.lineThrough);

  static TextStyle inputStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.input);

  static TextStyle hintStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.label);

  static TextStyle rating = GoogleFonts.openSans(
      fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.input);

  static TextStyle h1 = GoogleFonts.openSans(
      fontWeight: FontWeight.w500, fontSize: 30, color: AppColors.white);

  static TextStyle h2 = GoogleFonts.openSans(
      fontWeight: FontWeight.w500, fontSize: 24, color: AppColors.input);

  static TextStyle h3 = GoogleFonts.openSans(
      fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.input);

  static TextStyle pBold = GoogleFonts.openSans(
      fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.input);

  static TextStyle textMsg = GoogleFonts.openSans(
      fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.input);

  static TextStyle title = GoogleFonts.openSans(
      fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.input);

  static TextStyle label = GoogleFonts.openSans(
      fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.white);

  static TextStyle text = GoogleFonts.openSans(
      fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.input);

  static TextStyle time = GoogleFonts.openSans(
      fontWeight: FontWeight.w400, fontSize: 10, color: AppColors.input);

  static TextStyle button = GoogleFonts.openSans(
      fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.input);

  static TextStyle description = GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: const Color(0xFF404653));

  static TextStyle linkText = GoogleFonts.openSans(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.white,
    decoration: TextDecoration.underline,
  );
}
