import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortPage extends ConsumerWidget {
  const SortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(sortProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: sort.handleButtonPress,
              child: const Text('Press me'),
            ),
            sort.isLoading ? const CircularProgressIndicator() : Container(),
            sort.timeTaken != null ? Text(sort.timeTaken!) : Container(),
          ],
        ),
      ),
    );
  }
}
