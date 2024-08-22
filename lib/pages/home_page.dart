//import 'package:ampiy_app_assignment/components/bottom_nav_bar.dart';
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
  List<Ticker> _tickers = [];
  final Map<String, String> symbolToImageMap = {
  'BTCINR': 'assets/bitcoin.png',
  'ETHINR': 'assets/ethereum.png',
  'ATOMINR':'assets/atom.png',
  'ADAINR': 'assets/cardano.png',
  'TRXINR': 'assets/trx.png',
};

final Map<String, String> symbolToTokenMap = {
  'BTCINR': 'BitCoin',
  'ETHINR': 'Ethereum',
  'ATOMINR': 'Cosmos',
  'ADAINR': 'Cardano',
  'TRXINR': 'Tron',
};


  @override
  void initState() {
    super.initState();
//Initialize the websocket connection
    _webSocketService.connect();

    // Listen to the websocket stream and update the UI
    _webSocketService.onDataReceived = (tickers) {
      setState(() {
        _tickers = tickers;
        
      });
    };
    //  onError: (error){
    //   print('WebSocket error: $error');
    
    //  });
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
        //title: const Text('COINS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("COINS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8,),
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search, color:Colors.grey.shade800),
            
            ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              // ignore: unnecessary_null_comparison
              child: _tickers == null
              ? const Center(
                child: CircularProgressIndicator())
               : ListView.builder(
                itemCount: _tickers.length,
                itemBuilder: (context, index){
                  final ticker = _tickers[index];
                  final isEvenRow = index %2 ==0;
                  final imagePath = symbolToImageMap[ticker.symbol] ?? 'assets/default.png';
                  final tokenName = symbolToTokenMap[ticker.symbol] ?? ticker.symbol;

                  return Container(
                    color: isEvenRow ? const Color.fromARGB(192, 238, 238, 238) : const Color.fromARGB(255, 247, 246, 246),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16, ),
                    
                    //padding: const EdgeInsets.only(left:10, right:15, bottom: 15, top:16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(imagePath),
                          radius: 24,
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width:16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ticker.symbol.substring(0, ticker.symbol.length - 3),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(tokenName,
                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        //const SizedBox(width: 30,),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('₹${ticker.currentPrice}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16,),
                          Container(
                            width: 90,
                            height: 40,
                            padding: 
                          const EdgeInsets.symmetric(horizontal:12, vertical: 4),
                          decoration: BoxDecoration(
                    //color: ticker.priceChange >= 0 ? Colors.green : Colors.red,
                    //borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        ticker.priceChangePercent >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                        color: ticker.priceChangePercent >=0 ? Colors.green : Colors.red,
                        size: 16,
                      ),
                       //const  SizedBox(width: 4),
                      Text(
                        '${ticker.priceChangePercent.toStringAsFixed(2)}%',
                        style: TextStyle(color: 
                        ticker.priceChangePercent >=0 ? Colors.green : Colors.red, 
                        fontWeight: FontWeight.bold),
                      ),
                    
                      
                    ],
                  ),
                  ),
                        
                      ],
                      
                    ),
                    
                    
                  );
                  
                  

               },
               
               ),
            ),
          
          ],
          
        ),
      ),
      
      
    );
  }
}