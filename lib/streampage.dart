import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodappy/riverpod/future.stream.riverpod.dart';

// here we use StreamProvider and same as we use FutureProvider
class StreamPage extends ConsumerWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamProvider);
    return Scaffold(
      body: Center(
        child: streamValue.when(
          data: (data) => Text('Value: $data'),
          error: (e, s) => Text('Error $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ClockSecondStreamPage extends ConsumerWidget {
  const ClockSecondStreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clock = ref.watch(clockStreamProvider);

    return Scaffold(
      body: Center(
        child: clock.when(
            data: (data) => Text('Value $data'),
            error: (e, s) => Text(
                  e.toString(),
                ),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
