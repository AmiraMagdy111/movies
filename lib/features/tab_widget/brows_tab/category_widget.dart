import 'package:flutter/material.dart';
import 'package:movies/core/theming/colors_manager.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {

  final List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Drama",

  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {

            bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorsManager.primaryOrange
                      : ColorsManager.primaryBlack,
                  borderRadius: BorderRadius.circular(20),

                  border: Border.all(
                    color: ColorsManager.primaryOrange,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,decoration: TextDecoration.none,
                      color: isSelected
                          ? ColorsManager.primaryBlack
                          : ColorsManager.primaryOrange,
                    ),
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