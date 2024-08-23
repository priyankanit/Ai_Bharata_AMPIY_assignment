import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
_tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AMPIY'),
        elevation: 2,
        backgroundColor: Colors.grey[100],
        
        actions: [
          // TextField(
            
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     labelText: 'Seach eg Card',
          //     prefixIcon: const Icon(Icons.search, color: Colors.grey,),
          //   ),
          // ),
          const CircleAvatar(
             backgroundImage: AssetImage('assets/user.jpg'),
                          radius: 20,
                          backgroundColor: Colors.transparent,
          ),
          const SizedBox(width:10),
          const Text('Hi, Lia'),
          IconButton(onPressed: (){}, 
          icon: const Icon(Icons.notifications))
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          tabs:  [
            Tab(icon: Icon(Icons.add_circle_rounded, color: Colors.grey[850],), 
            text: 'Buy'),
            const Tab(icon: Icon(Icons.remove_circle_rounded),text: 'Sell'),
            const Tab(icon: Icon(Icons.person_2_rounded), text: 'Referral'),
             const Tab(icon: Icon(Icons.video_camera_back_rounded), text: 'Tutorial'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildHomePageContent(context),
         const Center(child: Text('Buy')),
         const Center(child: Text('Sell')),
         const Center(child: Text('Referral')),
         const Center(child: Text('Tutorial')),
        ],
      ),

    );
  }
}

  Widget _buildHomePageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    'Welcome to AMPIY',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your one-stop solution for all crypto trading needs.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                 const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Verify Account'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSipCard(context),
           const SizedBox(height: 20),
            _buildPerformanceGraph(context),
            const SizedBox(height: 20),
            _buildPopularCoins(context),
            const SizedBox(height: 20),
            _buildTrendingCoins(context),
             const SizedBox(height: 20),
             _buildZones(context),
            const SizedBox(height: 20),
            _buildNewsUpdates(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSipCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Wealth with SIP', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('Invest. Grow. Repeat. Grow your money with SIP now.', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Start SIP')),
               
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceGraph(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Market Variation Spectrum',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
      const SizedBox(height: 16,),
      Container(
        height: 200,
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: true),
            titlesData: const FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, interval: 1),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, interval: 1),
              ),
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(1, 1),
                  const FlSpot(2, 1.5),
                 const FlSpot(3, 1.4),
                 const FlSpot(4, 3.4),
                  const FlSpot(5, 2),
                  const FlSpot(6, 2.2),
                  const FlSpot(7, 1.8),
                ],
                isCurved: true,
                color: Colors.blue,
                barWidth: 2,
                belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
              ),
            ],
          ),
        ),
      ),
        ],
      ),
      ),
    );
  }

  Widget _buildPopularCoins(BuildContext context) {
    final popularCoins = [
    {'name': 'Bitcoin', 'image': 'assets/bitcoin.png', 'change': '10.45%'},
    {'name': 'Ethereum', 'image': 'assets/ethereum.png', 'change': '5.32%'},
    {'name': 'Cardano', 'image': 'assets/cardano.png', 'change': '7.89%'},
    {'name': 'Ripple', 'image': 'assets/atom.png', 'change': '4.76%'},
    {'name': 'Polkadot', 'image': 'assets/trx.png', 'change': '6.50%'},
  ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Popular Coins of the Month', 
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
        const SizedBox(height: 8),
        Container(
          height: 120,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularCoins.length,
          itemBuilder: (context, index) {
            final coin = popularCoins[index];
            return Container(
              width: 150,
              margin: const EdgeInsets.only(right: 16),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coin['name']!,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'This month: ${coin['change']}',
                                    style: TextStyle(
                                      color: double.parse(coin['change']!.replaceAll('%', '')) > 0 ? Colors.green : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(coin['image']!),
                          radius: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        ),
      ],
    );
  }

  Widget _buildTrendingCoins(BuildContext context) {

final List<Map<String, dynamic>> trendingCoins = [
      {
        'name': 'Bitcoin (BTC)',
        'logo': 'assets/bitcoin.png',
        'price': 50000.0,
        'change': 3.50,
        'priceGraph': [
          const FlSpot(0, 48000),
          const FlSpot(1, 48500),
          const FlSpot(2, 49000),
          const FlSpot(3, 50000),
          const FlSpot(4, 50500),
        ],
      },
      {
        'name': 'Ethereum (ETH)',
        'logo': 'assets/ethereum.png',
        'price': 1800.0,
        'change': -2.80,
        'priceGraph': [
          const FlSpot(0, 1900),
          const FlSpot(1, 1850),
          const FlSpot(2, 1820),
          const FlSpot(3, 1800),
          const FlSpot(4, 1790),
        ],
      },
      {
        'name': 'Cardano (ADA)',
        'logo': 'assets/cardano.png',
        'price': 2.2,
        'change': 1.95,
        'priceGraph': [
          const FlSpot(0, 2.0),
          const FlSpot(1, 2.1),
          const FlSpot(2, 2.15),
          const FlSpot(3, 2.2),
          const FlSpot(4, 2.25),
        ],
      },
      {
        'name': 'Ripple (XRP)',
        'logo': 'assets/default.png',
        'price': 1.0,
        'change': 2.10,
        'priceGraph': [
          const FlSpot(0, 0.95),
          const FlSpot(1, 0.98),
          const FlSpot(2, 1.0),
          const FlSpot(3, 1.05),
          const FlSpot(4, 1.10),
        ],
      },
      {
        'name': 'Cosmos (ATOM)',
        'logo': 'assets/atom.png',
        'price': 35.0,
        'change': 4.20,
        'priceGraph': [
          const FlSpot(0, 32),
          const FlSpot(1, 33),
          const FlSpot(2, 34),
          const FlSpot(3, 35),
          const FlSpot(4, 36),
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trending Coins', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics:const  NeverScrollableScrollPhysics(),
          itemCount: trendingCoins.length,
          itemBuilder: (context, index) {
            final coin = trendingCoins[index];
            final isPositive = coin['change'] > 0;

            return ListTile(
              leading: Image.asset(
                coin['logo'],
                width: 40,
                height: 40,
              ),
              title: Text(coin['name'], textAlign: TextAlign.justify,),
              subtitle: Row(
                children: [
                  const Spacer(),
                  const SizedBox(width: 20),
                  Text('₹${coin['price']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                                            width: 50,
                                            height: 30,
                                            child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: coin['priceGraph'],
                              isCurved: true,
                              color: isPositive ? Colors.green : Colors.red,
                              barWidth: 2,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: 
                                  isPositive
                                      ? Colors.green.withOpacity(0.3)
                                      : Colors.red.withOpacity(0.3)
                                  
                              ),
                            ),
                          ],
                        ),
                                            ),
                                          ),
                      ),
                ],
              ),
              trailing: Text(
                '${isPositive ? '+' : ''}${coin['change']}%',
                style: TextStyle(
                  fontSize: 16,
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

Widget _buildZones(BuildContext context) {
  final zones = [
    {
      'name': 'NFT',
      'coinsCount': 15,
      'coins': [
        {'name': 'Axie Infinity', 'image': 'assets/axis.png', 'change': '8.5%'},
        {'name': 'Enjin Coin', 'image': 'assets/enjin.png', 'change': '-3.2%'},
        {'name': 'Decentraland', 'image': 'assets/decentraland.png', 'change': '5.0%'},
      ],
    },
    {
      'name': 'PoS',
      'coinsCount': 10,
      'coins': [
        {'name': 'Cardano', 'image': 'assets/cardano.png', 'change': '7.8%'},
        {'name': 'Cosmos', 'image': 'assets/atom.png', 'change': '-1.5%'},
        {'name': 'Solana', 'image': 'assets/solana.png', 'change': '2.9%'},
      ],
    },
    {
      'name': 'DeFi',
      'coinsCount': 12,
      'coins': [
        {'name': 'Uniswap', 'image': 'assets/uniswap.png', 'change': '4.1%'},
        {'name': 'Aave', 'image': 'assets/money.png', 'change': '-2.0%'},
        {'name': 'Chainlink', 'image': 'assets/chainlink.png', 'change': '6.3%'},
      ],
    },
    {
      'name': 'Platform',
      'coinsCount': 8,
      'coins': [
        {'name': 'Ethereum', 'image': 'assets/ethereum.png', 'change': '5.7%'},
        {'name': 'Binance Coin', 'image': 'assets/binance.png', 'change': '-0.8%'},
        {'name': 'Avalanche', 'image': 'assets/avalanche.png', 'change': '3.4%'},
      ],
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Zones', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
        shrinkWrap: true, // Use shrinkWrap to make ListView take only necessary height
        itemCount: zones.length,
        itemBuilder: (context, index) {
          final zone = zones[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${zone['name']} (${zone['coinsCount']} Coins)',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (zone['coins'] as List).length,
                        itemBuilder: (context, coinIndex) {
                          final coin = (zone['coins'] as List)[coinIndex];
                          return Container(
                            width: 150,
                            margin: const EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(coin['image']!),
                                      radius: 15,
                                    ),
                                    const SizedBox(width: 10,),
                                    Text(
                                      coin['name']!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                    ),
                                    
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Change: ${coin['change']}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: double.parse(coin['change']!.replaceAll('%', '')) > 0
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
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
            ),
          );
        },
      ),
    ],
  );
}


  Widget _buildNewsUpdates(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('News Updates', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ListView(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
              leading: Image.asset('assets/bits.jpg', width: 100, height: 100, fit: BoxFit.cover),
              title: const Text('Bitcoin reaches new all-time high', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text('The price of Bitcoin has surged to a new all-time high, driven by institutional adoption.'),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              leading: Image.asset('assets/eths.jpg', width: 100, height: 100, fit: BoxFit.cover),
              title: const Text('Ethereum 2.0 Update Released', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text('The Ethereum network has undergone a major update to improve scalability and security.'),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              leading: Image.asset('assets/ripple.jpg', width: 100, height: 100, fit: BoxFit.cover),
              title: const Text('Ripple partners with major banks', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text('Ripple has announced partnerships with several major banks to improve cross-border payments.'),
            ),
          ),
        ],
        ),
      ],
    );
  }
