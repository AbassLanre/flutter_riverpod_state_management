abstract class WebsocketClient{
  Stream<int> getCounterStream([int start]);
  // passing [int start] as a parameter helps to easily place an initial
// value for the starting state
}