import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/auth/login/login_screen.dart';
import 'package:hdfc_reimagine/features/home/bill_payments/bill_payments_screen.dart';
import 'package:hdfc_reimagine/features/home/money_transfer/money_transfer_screen.dart';
import 'package:hdfc_reimagine/features/settings/settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../utills/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> image = [
    "assets/images/offerbanner.jpg",
    "assets/images/offerbanner2.jpg",
  ];

  bool _isBalanceVisible = true;
  final TextEditingController _fullNameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.person,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        title: Text(
          _fullNameController.text,
          style: const TextStyle(color: AppColors.darkGrey, fontSize: 20),
        ),
        actions: [
          Icon(
            Icons.notification_add,
            color: AppColors.darkGrey,
            size: 25,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            child: Icon(
              Icons.settings,
              color: AppColors.darkGrey,
              size: 25,
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Icon(
              Icons.exit_to_app,
              color: AppColors.darkGrey,
              size: 25,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: _buildDrawer(),
      body: buildBody(),
      backgroundColor: Colors.white,
    );
  }
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    color: AppColors.primaryBlue,
                    size: 40,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'John', // Display the username in the drawer header
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Close the drawer and navigate to home
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              // Close the drawer and navigate to the profile screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Close the drawer and navigate to settings
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Handle logout
              Supabase.instance.client.auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }


  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 20),
            _searchField(),
            const SizedBox(height: 40),
            _accountBalance(),
            const SizedBox(height: 40),
            _sendMoney(),
            const SizedBox(height: 20),
            _sendMoneyIcons(),
            const SizedBox(height: 40),
            _quickLink(),
            const SizedBox(height: 20),
            _quickIconFinal(),
            const SizedBox(height: 40),
            _deals(),
            const SizedBox(height: 20),
            _dealsSlider()
          ],
        ),
      ),
    );
  }


  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(4),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)),
          labelText: "Search",
          hintText: "Search",
          labelStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _accountBalance() {
    return Container(
      height: 130,
      width: 370,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Saving Account Balance",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isBalanceVisible ? "RS.7,50,000" : "******",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                    });
                  },
                  child: CircleAvatar(
                    minRadius: 24,
                    backgroundColor: AppColors.secondaryBlue,
                    child: const Icon(
                      CupertinoIcons.eye_slash_fill,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _sendMoney() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Send Money",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "View More",
          style: TextStyle(
              color: AppColors.secondaryBlue,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _sendMoneyIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        sendMoneyIcons("AL", "Allen", Colors.pinkAccent),
        sendMoneyIcons("FN", "FAN", Colors.blueAccent.shade200),
        sendMoneyIcons("AH", "Ali Haider", Colors.yellow.shade200),
        sendMoneyIcons("SB", "Sadik Bhai", Colors.green),
      ],
    );
  }

  Widget sendMoneyIcons(String image, String title, Color background) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: background, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              image,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ],
    );
  }

  Widget _quickLink() {
    return Row(
      children: [
        Text(
          "Quick Links",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget _quickIconFinal() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BillPaymentsScreen()));
                },
                child:
                    _quickIcons("assets/icons/invoice.png", "Bill\nPayment")),
            _quickIcons("assets/icons/payment.png", "Recharge"),
            _quickIcons("assets/icons/upi.png", "UPI"),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoneyTransferScreen()));
                },
                child: _quickIcons(
                    "assets/icons/transfer.png", "Money\nTransfer")),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _quickIcons("assets/icons/trophy.png", "Rewards"),
            _quickIcons("assets/icons/donation.png", "deposits"),
            _quickIcons("assets/icons/borrow.png", "Borrow"),
            _quickIcons("assets/icons/profits.png", "Invest"),
          ],
        )
      ],
    );
  }

  Widget _quickIcons(String icon, String title) {
    return Column(
      children: [
        Image.asset(
          icon,
          color: AppColors.secondaryBlue,
          height: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          softWrap: true,
        ),
      ],
    );
  }

  Widget _deals() {
    return Row(
      children: [
        Text(
          "Deals for you",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _dealsSlider() {
    return CarouselSlider(
      items: image.map((imgPath) {
        return Image.asset(
          imgPath,
          fit: BoxFit.cover,
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 8,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
        animateToClosest: true,
      ),
    );
  }
}
