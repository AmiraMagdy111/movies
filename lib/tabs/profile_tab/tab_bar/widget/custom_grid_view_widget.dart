import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridViewWidget extends StatelessWidget {
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final int itemCount;
  final Widget Function(BuildContext,int) itemBuilder;
  const CustomGridViewWidget({super.key,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.childAspectRatio,
    required this.itemCount,
    required this.itemBuilder
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: REdgeInsets.symmetric(vertical: 20),
      itemCount: itemCount,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:crossAxisCount ,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio:childAspectRatio,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
