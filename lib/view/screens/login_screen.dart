import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/theme/app_theme.dart';
import 'package:task_planner/theme/colors.dart';
import 'package:task_planner/global.dart';
import 'package:task_planner/view/custom_widgets/auth_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: key,
              child: Column(
                spacing: style.insets.lg,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SIGN IN', style: style.text.boldLarge),
                  AuthField(
                    hintText: 'Email',
                    controller: loginController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      } else if (!emailRegex.hasMatch(value)) {
                        return "Please enter valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 4) {
                        return "Plese enter aleast 4 character";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                      ),
                      onPressed: () {
                        if (key.currentState?.validate() == true) {
                          Navigator.pushNamed(context, 'home');
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          shadowColor: AppColors.black,
                          elevation: 4,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.tertiary,
                          foregroundColor: AppColors.white,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.g_mobiledata_sharp),
                      ),
                      SizedBox(width: style.insets.lg),
                      IconButton(
                        style: IconButton.styleFrom(
                          shadowColor: AppColors.black,
                          elevation: 4,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.tertiary,
                          foregroundColor: AppColors.white,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.apple),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          shadowColor: AppColors.black,
                          elevation: 4,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.tertiary,
                          foregroundColor: AppColors.white,
                        ),
                        onPressed: () {
                          ref.watch(appthemeProvider.notifier).toggleTheme();
                        },
                        icon: Icon(Icons.dark_mode),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
