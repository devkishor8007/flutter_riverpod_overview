import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpodappy/riverpod/clock.riverpod.dart';

class ClockPage extends ConsumerWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(clockProvider);
    final timeFormated = DateFormat.Hms().format(currentTime);
    return Scaffold(
      body: Center(
        child: Text(
          timeFormated,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
