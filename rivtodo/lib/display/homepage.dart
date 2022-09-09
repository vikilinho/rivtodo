import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) {
  return 20;
});
//You need a state provider for state changes to work.
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //access the provider using ref.read then update the state
        onPressed: (() => ref.read(counterStateProvider.notifier).state++),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text("value: $counter"),
      ),
    );
  }
}
