import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) {
  return 20;
});
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(valueProvider);
    var counter = ref.watch(counterStateProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //access the providerusing ref.read then update the state
        onPressed: (() => ref.read(counterStateProvider.notifier).state++),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text("value: $value"),
      ),
    );
  }
}
