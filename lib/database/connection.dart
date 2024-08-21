import 'dart:convert';

import 'package:ampiy_app_assignment/model/ticker_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService{
  
  // WebSocket channel
 late WebSocketChannel _channel;

  // Function to initialize the websocket connection
  void connect(){
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://prereg.ex.api.ampiy.com/prices'),
    );

    print('Websocket connected');

    // send a subscription message after connecting
    _channel.sink.add(jsonEncode({
      "method": "SUBSCRIBE",
      "params": ["all@ticker"],
      "cid": 1,
    }));

    print('Subscription msg sent');
  }

  // Function to listen to the websocket stream
  // Stream<Ticker> getStream(){
  //   return _channel.stream.map((message){
  //     final decodedMessage = jsonDecode(message);
  //     print('Message received: $decodedMessage');
  //     return Ticker.fromJson(decodedMessage['data'][0]);
  //   }).handleError((error){
  //     print('Websocket error: $error');
  //   });
  // }

  Stream<Ticker?> getStream() {
  return _channel.stream.map((message) {
    try{
    final decodedMessage = jsonDecode(message);
    print("Raw message: $message");
    print("Decoded message: $decodedMessage");

    // Check if the data key exists and is properly formatted
      return Ticker.fromJson(decodedMessage['data'][0]);
    } catch(error){
      print('Error parsing JSON: $error');
      return null;
    }
  }).where((ticker) => ticker != null);
}
 
 // Function to close the websocket connection
 void disconnect(){
  _channel.sink.close();
 }

}