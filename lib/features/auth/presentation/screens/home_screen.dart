import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/shared/providers/authentication_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME PAGE")),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await ref.watch(fireAuthProvider).signout();
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                'login',
                (route) => false,
              );
            }
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
