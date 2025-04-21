import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/core/shared%20widgets/custom_app_button.dart';
import 'package:food_recipes/features/home/presentation/view/home_view.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.nameController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomAppButton(
      text: "Sign Up",
      onPressed: () async {
        if (!formKey.currentState!.validate()) {
          return;
        }
        try {
          final UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
          await user.user?.updateDisplayName(nameController.text);
          await user.user?.reload();
          final updatedUser = FirebaseAuth.instance.currentUser!;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(user: updatedUser),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("The password provided is too weak."),
                backgroundColor: Colors.red,
              ),
            );
          } else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("The account already exists for that email."),
                backgroundColor: Colors.red,
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$e"), backgroundColor: Colors.red),
          );
        }
      },
      height: 60,
    );
  }
}
