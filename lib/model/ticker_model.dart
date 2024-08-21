class Ticker {
  final String symbol;  // Symbol (e.g., BTCINR)
  final String priceChange;  // Price change (small 'p')
  final String priceChangePercent;  // Price change percent (capital 'P')
  final String currentPrice;  // Current price ('c')
  final String openPrice;  // Open price ('o')
  final String highPrice;  // High price ('h')
  final String lowPrice;  // Low price ('l')
  final String bestBidPrice;  // Best bid price ('b')
  final String bestAskPrice;  // Best ask price ('a')

  Ticker({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.currentPrice,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.bestBidPrice,
    required this.bestAskPrice,
  });

  // Factory method to create a Ticker object from JSON
  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      symbol: json['s'] as String,
      priceChange: (json['p']) as String,
      priceChangePercent: (json['P']) as String,
      currentPrice: (json['c']) as String,
      openPrice: (json['o']) as String,
      highPrice: (json['h']) as String,
      lowPrice: (json['l']) as String,
      bestBidPrice: (json['b']) as String,
      bestAskPrice: (json['a']) as String,
    );
  }
}