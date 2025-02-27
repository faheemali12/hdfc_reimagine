import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/utills/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: Icon(
          CupertinoIcons.arrow_left,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          "Accounts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            labelColor: AppColors.primaryBlue,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              _buildTab("Savings", 0),
              _buildTab("Fixed Deposit", 1),
              _buildTab("Recurring Deposit", 2),
              _buildTab("Tax Saver Deposit", 3),
            ],
          ),
        ),
      ),
      body: _tabbar(),
      backgroundColor: Colors.white,
    );
  }

  Widget _tabbar() {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(), // 🚫 Prevents swiping
      children: [
        _savingAccount(),
        Center(child: Text("Fixed Deposit Content")),
        Center(child: Text("Recurring Deposit Content")),
        Center(child: Text("Tax Saver Deposit Content")),
      ],
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.primaryBlue : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _savingAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _savingCard(),
            SizedBox(height: 40),
            _recentTrans(),
            SizedBox(height: 20),
            _transactionList(),
            SizedBox(height: 40),
            _statementButton(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _savingCard() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 250,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoText("ACCOUNT NUMBER:", "8907 6846 5729 54"),
                _infoText("AVAILABLE BALANCE", "₹7,500"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoText("CARD HOLDER NAME", "JOHN REGO"),
                _infoText("CUSTOMER ID", "478039847"),
                _infoText("BRANCH", "478"),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 7,
                  shadowColor: Colors.black,
                ),
                child: Text(
                  "View Account Details",
                  style:
                      TextStyle(color: AppColors.secondaryBlue, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoText(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _recentTrans() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recent Transactions",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: AppColors.secondaryBlue,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  Widget _recentTransaction(
      String image, String title, String subtitle, String amount) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 50,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: AppColors.lightGrey),
      ),
      trailing: Text(
        amount,
        style: TextStyle(fontSize: 15, color: Colors.red),
      ),
    );
  }

  Widget _transactionList() {
    return Column(
      children: [
        _recentTransaction(
            "assets/images/wrogn.png", "Wrogn Shoes", "12.00 PM", "-1800"),
        _recentTransaction(
            "assets/images/zomato.png", "Burger", "12.00 PM", "-50"),
        _recentTransaction(
            "assets/images/levis.png", "OverSized T", "12.00 PM", "-5000"),
        _recentTransaction(
            "assets/images/sketchers.jpg", "Casual Shoes", "12.00 PM", "-6500"),
      ],
    );
  }

  Widget _statementButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryBlue,
            minimumSize: Size(double.infinity, 50)),
        onPressed: () {},
        child: Text(
          "Request Statement",
          style: TextStyle(
              color: AppColors.whiteGrey,
              fontSize: 15,
              fontWeight: FontWeight.w200),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
