import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) => Clock());

class Clock extends StateNotifier<DateTime> {
  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }
  late final Timer _timer;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
