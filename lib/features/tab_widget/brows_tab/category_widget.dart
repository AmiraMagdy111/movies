import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theming/colors_manager.dart';

class CategoryListWidget extends StatelessWidget {
  final List<String> genres;
  final String? selectedGenre;
  final Function(String) onTap;

  const CategoryListWidget({
    super.key,
    required this.genres,
    required this.selectedGenre,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) {
      return SizedBox(
        height: 50.r,
        child: Center(child: Text("No Categories")),
      );
    }
    return SafeArea(
      child: SizedBox(
        height: 50.h,
        child: ListView.builder(
           padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            String genre = genres[index];

            bool isSelected = genre == selectedGenre;

            return GestureDetector(
              onTap: () => onTap(genre),
              child:
              Container(
                margin: REdgeInsets.symmetric(horizontal: 6),
                padding:  REdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorsManager.primaryOrange
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.orange),
                ),
                child: Text(
                  genre,
                  style:
                  GoogleFonts.inter(
                      color: isSelected
                          ? ColorsManager.black
                          : ColorsManager.primaryOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      decoration: TextDecoration.none
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}