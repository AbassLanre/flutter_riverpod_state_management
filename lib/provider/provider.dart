
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_state_management/websocket/websocketClient.dart';
import 'package:flutter_riverpod_state_management/websocket/websocketClientImpl.dart';

final counterProvider = StateProvider((ref)=>0);
// if you want to dispose off the state while navigating to
// new pages(especially expensive ones), you can use:
// final counterProvider = StateProvider.autoDispose((ref)=>0);
// ref.invalidate(counterProvider)->this returns void
// and ref.refresh(counterProvider)-> this returns the value(state)
// restores the data to its initial value

final websocketClientProvider = Provider<WebsocketClient>((ref) => FakeWebsocketClient());
final streamCounterProvider = StreamProvider<int>((ref) {
  final wsClient = ref.watch(websocketClientProvider);
  return wsClient.getCounterStream();
});
//passing a value inside provider from ref.watch
final streamCounterFamilyProvider = StreamProvider.autoDispose.family<int,int>((ref,start) {
  final wsClient = ref.watch(websocketClientProvider);
  return wsClient.getCounterStream(start);
});