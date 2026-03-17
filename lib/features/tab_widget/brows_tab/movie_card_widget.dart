import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final String image;

  const MovieCardWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}