import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeName extends StatelessWidget {
  const RecipeName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Spicy chicken burger with French fires",
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );
  }
}
