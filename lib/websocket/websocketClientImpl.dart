
import 'package:flutter_riverpod_state_management/websocket/websocketClient.dart';

class FakeWebsocketClient implements WebsocketClient{
  @override
  Stream<int> getCounterStream([int start=0]) async*{
    // TODO: implement getCounterStream
    int i =start;
    while(true){
      yield i++;
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

}