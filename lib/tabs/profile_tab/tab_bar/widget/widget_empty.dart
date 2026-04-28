import 'package:flutter/material.dart';

class WidgetEmpty extends StatelessWidget {
  const WidgetEmpty({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty.png'),
            const SizedBox(height: 10),
            const Text(
              "No content yet",
              style: TextStyle(color: Colors.white24),
            ),
          ],
        ),
      );
    }
  }

