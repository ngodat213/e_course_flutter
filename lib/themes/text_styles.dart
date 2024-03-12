import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_course_flutter/themes/colors.dart';

class TxtStyle {
  TxtStyle._();

  static TextStyle p = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.label);

  static TextStyle labelStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.label);

  static TextStyle lineThrough = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.label,
      decoration: TextDecoration.lineThrough);

  static TextStyle inputStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.input);

  static TextStyle hintStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.label);

  static TextStyle rating = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.input);

  static TextStyle h1 = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 30, color: AppColors.white);

  static TextStyle h2 = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 24, color: AppColors.input);

  static TextStyle h3 = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.input);

  static TextStyle pBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.input);

  static TextStyle textMsg = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.input);

  static TextStyle title = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.input);

  static TextStyle label = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.input);

  static TextStyle text = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.input);

  static TextStyle time = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 10, color: AppColors.input);

  static TextStyle button = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.input);

  static TextStyle description = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: const Color(0xFF404653));

  static TextStyle linkText = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.white,
    decoration: TextDecoration.underline,
  );
}
