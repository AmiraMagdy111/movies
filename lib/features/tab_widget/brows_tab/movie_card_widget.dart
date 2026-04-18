import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final Map movie;

  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
            Image.network(
              movie['medium_cover_image'] ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(Icons.image_not_supported, color: Colors.white),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          movie['title'] ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}