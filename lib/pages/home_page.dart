//import 'package:ampiy_app_assignment/database/connection.dart';
import 'package:ampiy_app_assignment/database/connection.dart';
import 'package:ampiy_app_assignment/model/ticker_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WebSocketService _webSocketService = WebSocketService();
  Ticker? _ticker;

//  @override
//   void initState() {
//     super.initState();
//     _ticker = null; // or initialize it with a valid object
//    // fetchDataFromWebSocket();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("WebSocket Example")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: _ticker == null
//             ? const Center(child: CircularProgressIndicator())
//             : buildTickerCard(),
//       ),
//     );
//   }

//   Widget buildTickerCard() {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               _ticker!.symbol, // Use the null-check operator
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Current Price: ₹${_ticker!.currentPrice}',
//               style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               'Change: ${_ticker!.priceChange}%',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: _ticker!.priceChange < 0 ? Colors.red : Colors.green,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void fetchDataFromWebSocket() {
//     // Simulate fetching data
//     setState(() {
//       _ticker = Ticker(
//         symbol: "BTCINR",
//         currentPrice: 3615589.2020,
//         priceChange: -1351.7800000,
//         priceChangePercent: -2.740,
//         openPrice: 3717432.3072,
//         highPrice: 3744326.4270,
//         lowPrice: 3595768.0014,
//         bestBidPrice: 3615139.4222,
//         bestAskPrice: 3615372.2228
//         // other fields
//       );
//     });
//   }





  @override
  void initState() {
    super.initState();
//Initialize the websocket connection
    _webSocketService.connect();

    // Listen to the websocket stream and update the UI
    _webSocketService.getStream().listen((ticker) {
      setState(() {
        _ticker = ticker;
        
      });
    }, onError: (error){
      print('WebSocket error: $error');
    
     });
  } 

  @override
  void dispose() {
    // Close the WebSocket connection
    _webSocketService.disconnect();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('COINS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search, color:Colors.grey.shade800),
            
            ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: _ticker == null
              ? const Center(
                child: CircularProgressIndicator())
              :Column(children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_ticker!.symbol,
                        style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold
                        ),
                        ), 
                        const SizedBox(height: 8),
                          Text(
                            'Current Price: ₹${_ticker!.currentPrice}', // Current Price
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Change: ${_ticker!.priceChange}%', // Price Change Percent
                            style: TextStyle(
                              fontSize: 18,
                              color: _ticker!.priceChange.startsWith('-')
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),

                      ],
                    ),),

                )
              ],
              ),
            ),
          ],
        ),
        
      ),
      
    );
  }
}