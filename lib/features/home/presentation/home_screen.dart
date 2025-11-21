import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/features/home/providers/home_provider.dart';
import 'package:task_planner/shared/providers/authentication_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataProvider = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(title: Text("HOME PAGE")),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Durations.extralong1,
            () => ref.refresh(homeProvider),
          );
        },
        child: Column(
          children: [
            TextButton(
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
            dataProvider.when(
              data: (data) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) =>
                        ListTile(title: Text("data ${data[index]['title']}")),
                  ),
                );
              },
              error: (error, stackTrace) =>
                  Expanded(child: Center(child: Text(error.toString()))),
              loading: () =>
                  Expanded(child: Center(child: CircularProgressIndicator())),
            ),
          ],
        ),
      ),
    );
  }
}
