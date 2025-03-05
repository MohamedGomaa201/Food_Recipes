// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_recipes/core/themes/app_colors.dart';

// class TopNavigationBarTap extends StatelessWidget {
//   const TopNavigationBarTap({
//     super.key,
//     required int selectedIndex,
//     required this.cIndex,
//     required this.name,
//   }) : _selectedIndex = selectedIndex;

//   final int _selectedIndex;
//   final int cIndex;
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     return Tab(
//       child: Container(
//         height: 31.h,
//         decoration: BoxDecoration(
//           color: _selectedIndex == cIndex ? AppColors.mainColor : Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: Center(
//           child: Text(
//             name,
//             style: TextStyle(
//               color:
//                   _selectedIndex == cIndex ? Colors.white : AppColors.mainColor,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
