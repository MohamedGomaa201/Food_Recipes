import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeName extends StatelessWidget {
  const RecipeName({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
