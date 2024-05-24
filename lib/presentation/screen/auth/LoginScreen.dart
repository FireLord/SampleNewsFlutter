import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_news/presentation/screen/auth/AuthController.dart';
import 'package:sample_news/presentation/screen/bottomTab/MainTabScreen.dart';
import '../../../injection_container.dart';
import 'components/InputField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = sl<AuthController>();
    final size = MediaQuery.of(context).size;

    return Obx(() {
      if (authController.user.value != null) {
        // Use a post-frame callback to ensure navigation occurs after the build is complete
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAll(() => const MainTabScreen());
        });
      }

      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Login Text
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Login Form
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Email Field
                        InputField(
                          hintText: "abc@example.com",
                          icon: Icons.person_outline_outlined,
                          labelText: "Email",
                          textValue: (value) => authController.email.value = value,
                        ),

                        SizedBox(height: size.height * 0.02),

                        // Password Field
                        InputField(
                          hintText: "Password",
                          icon: Icons.lock_outline,
                          labelText: "Password",
                          isPassword: true,
                          textValue: (value) => authController.password.value = value,
                        ),

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?"),
                          ),
                        ),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => authController.onSignInEmail(),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.purple),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        // Register Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => authController.onRegisterEmail(),
                            child: const Text("Register"),
                          ),
                        ),

                        // Google Login Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => authController.onGoogleSignIn(),
                            child: const Text("Login with Google"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}