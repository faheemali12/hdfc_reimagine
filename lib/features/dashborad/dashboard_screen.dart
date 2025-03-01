import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/accounts/account.dart';
import 'package:hdfc_reimagine/features/cards/card_screen.dart';
import 'package:hdfc_reimagine/features/home/home_screen.dart';
import 'package:hdfc_reimagine/features/offers/offer_screen.dart';
import 'package:hdfc_reimagine/features/scanner/qr_code_scanner.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    OfferScreen(),
    QrCodeScanner(),
    Account(),
    CardScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: screens[currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.blue.shade900.withOpacity(0.8),
                  Colors.blueAccent.shade700.withOpacity(0.5),
                  Colors.blue.withOpacity(0.1),
                ],
                stops: const [0.3, 0.6, 1.0],
                radius: 1.0,
                center: Alignment.center,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),

          SizedBox(
            width: 55,
            height: 55,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrCodeScanner()));
              },
              shape: const CircleBorder(),
              backgroundColor: Colors.blue.shade900,
              elevation: 5,
              child: const Icon(Icons.qr_code_scanner,
                  color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.local_offer, "Offers", 1),
              const SizedBox(
                width: 55,
              ), // Adjust spacing for scanner FAB
              _buildNavItem(Icons.account_balance_outlined, "Accounts", 3),
              _buildNavItem(Icons.add_card, "Cards", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Smooth transition
            curve: Curves.easeInOut,
            child: Icon(
              icon,
              color: currentIndex == index ? Colors.blue : Colors.grey,
              size: currentIndex == index ? 33 : 28, // Smooth transition effect
            ),
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: currentIndex == index ? Colors.blue : Colors.grey,
              fontSize: 12,
              fontWeight:
                  currentIndex == index ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
