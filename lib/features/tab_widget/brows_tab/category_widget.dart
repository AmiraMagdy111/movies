import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'bloc/browse_bloc.dart';
import 'bloc/browse_state.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseBloc, BrowseState>(
      builder: (context, state) {

        // حالة اللودينج
        if (state is BrowseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // حالة النجاح
        if (state is BrowseSuccess) {
          var categories = state.genres;

          return Padding(
            padding: const EdgeInsets.only(top: 20),
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
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ColorsManager.primaryOrange
                            : ColorsManager.primaryBlack,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: ColorsManager.primaryOrange,
                          width: 1.5,
                        ),
                      ),

                      child: Center(
                        child: Text(
                          categories[index].name ,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
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

        // أي حالة تانية
        return const SizedBox();
      },
    );
  }
}