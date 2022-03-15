import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodappy/riverpod/simple.riverpod.dart';

class CountPage extends ConsumerWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(numberstateProvider);
    ref.listen<StateController<int>>(numberstateProvider.state,
        (previous, current) {
      // note: this callback executes when the provider value changes,
      // not when the build method is called
      debugPrint('ref.listen is calling');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: Text('Value is ${current.state}')),
      );
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(numberstateProvider.state).state++;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Value $value',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}