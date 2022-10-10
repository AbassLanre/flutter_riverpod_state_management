import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_state_management/provider/provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if we just want to watch and pass changes without performing
    // any sort of clauses like if this is 5 do this else do that
    // then belo is fine
    ///////////////////////////////////////////////
    final int tex = ref.watch(counterProvider);
    final AsyncValue<int> textCounter = ref.watch(streamCounterFamilyProvider(5));
    ///////////////////////////////////////////////
// every logic involving states should be written in listen
    // else if we want something to happen like an action during
    // ref.watching then we do below:
    ////////////////////////////////////////////////
    // ref.listen<int>(counterProvider,
    //         (previous, next) {
    //   if(next >=5){
    //     showDialog(context: context, builder: (_)=>
    //     AlertDialog(
    //       title: const Text('Warning'),
    //       content: Text('Counter is high, please reset'),
    //       actions: [
    //         TextButton(
    //             onPressed: (){
    //               Navigator.pop(context);
    //             },
    //             child: const Text('OK'))
    //       ],
    //     )
    //     );
    //   }
    //         });
    ///////////////////////////////////////////////////

    return Scaffold(
      appBar: AppBar(
        title: const Text('Count') ,
        actions: [
          IconButton(
              onPressed: (){
                ref.invalidate(streamCounterProvider);
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Center(
        child: Text(
          textCounter.when(
              data: (int value)=>value,
              error: (Object e,_)=>e,
              loading: ()=>5).toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     ref.read(counterProvider.notifier).state++;
      //   },
      //   child: const Icon(Icons.add,),
      // ),
    );
  }
}
