import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/shared/providers/user_auth_provider.dart';
import 'package:task_planner/theme/app_theme.dart';
import 'package:task_planner/theme/colors.dart';
import 'package:task_planner/global.dart';
import 'package:task_planner/view/custom_widgets/auth_text_field.dart';

class LoginPage extends StatelessWidget {
  static TextEditingController loginController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static GlobalKey<FormState> formkey = GlobalKey();

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final authState = ref.watch(authProvider);
        ref.listen(authProvider, (prev, next) {
          if (next is AuthErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(next.errorMsg)));
          } else if (next is AuthSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('SuccessFully Logged in')));
          }
        });
        return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formkey,
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
                      onPressed: (authState is AuthLoadingState)
                          ? null
                          : () {
                              if (formkey.currentState?.validate() == true) {
                                ref
                                    .read(authProvider.notifier)
                                    .login(
                                      loginController.text,
                                      passwordController.text,
                                    );
                              }
                            },
                      child: (authState is AuthLoadingState)
                          ? SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
                            )
                          : Text('Submit'),
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
                          ref.read(appthemeProvider.notifier).toggleTheme();
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
