import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/core/shared%20widgets/custom_app_button.dart';
import 'package:food_recipes/features/auth/presentation/view/helpers/show_snack_bar.dart';
import 'package:food_recipes/features/home/presentation/view/home_view.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomAppButton(
      text: "Sign In",
      onPressed: () async {
        if (!formKey.currentState!.validate()) {
          return;
        }
        try {
          final UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(userCredential: user),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            showSnackBar(context, "This email is not registered yet");
          } else if (e.code == 'wrong-password') {
            showSnackBar(context, "Wrong password");
          } else {
            showSnackBar(context, "Error: ${e.message}");
          }
        } catch (e) {
          showSnackBar(context, "Unexpected error: $e");
        }
      },

      height: 65,
    );
  }
}
