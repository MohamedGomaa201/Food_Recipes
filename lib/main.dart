import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/auth/presentation/view/signin_view.dart';
import 'package:food_recipes/features/home&search/presentation/view/home_view.dart';
import 'package:food_recipes/features/saved/data/favorites_provider.dart';
import 'package:food_recipes/features/splash/presentation/view/splash_view.dart';
import 'package:food_recipes/firebase_options.dart';
import 'package:provider/provider.dart';

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
      child: ChangeNotifierProvider(
        create:
            (_) => FavoritesProvider(
              userId: FirebaseAuth.instance.currentUser!.uid,
            ),
        child: MaterialApp(
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) {
                return const SplashView();
              }

              final user = snapshot.data;
              if (user == null) {
                return const SigninView();
              }

              return HomeView(user: user);
            },
          ),
        ),
      ),
    );
  }
}
