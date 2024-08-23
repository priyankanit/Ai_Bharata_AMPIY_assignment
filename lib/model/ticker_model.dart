class Ticker {
  final String symbol;  // Symbol (e.g., BTCINR)
  final String token;
  final double priceChange;  // Price change (small 'p')
  final double priceChangePercent;  // Price change percent (capital 'P')
  final double currentPrice;  // Current price ('c')
  final double openPrice;  // Open price ('o')
  final double highPrice;  // High price ('h')
  final double lowPrice;  // Low price ('l')
  final double bestBidPrice;  // Best bid price ('b')
  final double bestAskPrice;  // Best ask price ('a')

  Ticker({
    required this.symbol,
    required this.token,
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
      token: json['T'] as String,
      priceChange: double.parse(json['p']),
      priceChangePercent: double.parse(json['P']),
      currentPrice: double.parse(json['c']),
      openPrice: double.parse(json['o']),
      highPrice: double.parse(json['h']),
      lowPrice: double.parse(json['l']),
      bestBidPrice: double.parse(json['b']),
      bestAskPrice: double.parse(json['a']),
    );
  }
}