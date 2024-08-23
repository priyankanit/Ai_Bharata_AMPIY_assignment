import 'package:ampiy_app_assignment/pages/coins_page.dart';
import 'package:ampiy_app_assignment/pages/home_page.dart';
import 'package:ampiy_app_assignment/pages/profile_page.dart';
import 'package:ampiy_app_assignment/pages/wallet_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;

  final List<Widget> _pages =[
    const HomePage(),
    const CoinsPage(),
   const WalletPage(),
    const ProfilePage(),
  ];

  void _onTabSelected(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTransactionButtonPressed(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: 
      // BottomAppBar(
      //    shape: const CircularNotchedRectangle(),
      //   notchMargin: 6.0,
      //   child: 
        BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabSelected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle_outlined,),
              label: 'Coins',
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTransactionButtonPressed,
        
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color:Colors.white, width: 2.0),
          
        ),
         child: const Icon(Icons.swap_vert),
      ),
     
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}