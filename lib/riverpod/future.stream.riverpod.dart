import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) {
  return Future.value(36);
});

final streamProvider = StreamProvider((ref) {
  return Stream.fromIterable([36, 45, 72]);
});


final clockStreamProvider = StreamProvider<int>((ref){
  return Stream.periodic(const Duration(seconds: 1), (x)=> x);
});