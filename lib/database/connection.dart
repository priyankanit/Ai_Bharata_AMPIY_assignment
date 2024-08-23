import 'dart:convert';

import 'package:ampiy_app_assignment/model/ticker_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService{
  
  // WebSocket channel
 late WebSocketChannel _channel;
 Function(List<Ticker>)? onDataReceived;

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

    _channel.stream.listen((message) {
      final decodedMessage = jsonDecode(message);
      final List<dynamic> data = decodedMessage['data'];
      final tickers = data.map((item) => Ticker.fromJson(item)).toList();

      if (onDataReceived != null) {
        onDataReceived!(tickers);
      }
    }, onError: (error) {
      print("WebSocket error: $error");
    });
  }
   void disconnect() {
    _channel.sink.close();
  }

  }

