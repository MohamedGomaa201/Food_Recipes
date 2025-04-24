import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/auth/presentation/view/signin_view.dart';
import 'package:food_recipes/features/home&search/presentation/view/home_view.dart';
import 'package:food_recipes/features/splash/presentation/view/splash_view.dart';
import 'package:food_recipes/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: AppColors.mainColor,
            cursorColor: AppColors.mainColor,
            selectionColor: AppColors.grey3,
          ),
          fontFamily: "Poppins",
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          primaryColor: AppColors.mainColor,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return SplashView();
            }
            return snapshot.data != null
                ? HomeView(user: snapshot.data!)
                : SigninView();
          },
        ),
      ),
    );
  }
}
