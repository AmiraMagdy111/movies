import 'package:flutter/material.dart';

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
      return const SizedBox(
        height: 50,
        child: Center(child: Text("No Categories")),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            String genre = genres[index];

            bool isSelected = genre == selectedGenre;

            return GestureDetector(
              onTap: () => onTap(genre),
              child:
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.orange
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
                child: Text(
                  genre,
                  style:
                  TextStyle(
                    color: isSelected
                        ? Colors.black
                        : Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
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