import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/dashborad/dashboard_screen.dart';
import 'package:hdfc_reimagine/features/home/bill_payments/add_biller.dart';
import '../../../utills/colors.dart';

class BillPaymentsScreen extends StatefulWidget {
  const BillPaymentsScreen({super.key});

  @override
  State<BillPaymentsScreen> createState() => _BillPaymentsScreenState();
}

class _BillPaymentsScreenState extends State<BillPaymentsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
          child: Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 20),
        ),
        title: Text("Bill Payments",
            style: TextStyle(color: AppColors.whiteGrey, fontSize: 25)),
      ),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          _billerText(),
          SizedBox(height: 20),
          _billerList(),
          SizedBox(height: 20),
          _addBiller(),
          SizedBox(height: 20),
          _tabSection(),
        ],
      ),
    );
  }

  Widget _billerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Your Billers",
          style: TextStyle(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w800,
              fontSize: 18),
        ),
      ],
    );
  }

  Widget _biller(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppColors.secondaryBlue),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
      ),
      trailing: Icon(CupertinoIcons.right_chevron),
    );
  }

  Widget _billerList() {
    return Column(
      children: [
        _biller(
            "Airtel Family Plan", "Airtel Postpaid", Icons.phone_iphone_sharp),
        _biller("Airtel Fiber", "Airtel Landline", Icons.phone_iphone_sharp),
        _biller(
            "Mescom", "Mangalore Electricity Supply Co. Ltd", Icons.flash_on),
      ],
    );
  }

  Widget _addBiller() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryBlue,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddBiller()));
      },
      child: Text(
        "+ Add Biller",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _tabSection() {
    if (_tabController == null) return SizedBox();

    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController!,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Scheduled"),
              Tab(text: "History"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController!,
              children: [
                _scheduledTransactions(),
                Center(
                    child: Text("No history available",
                        style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _scheduledTransactions() {
    return ListView(
      children: [
        _biller("Netflix", "Monthly Subscription", Icons.movie),
        _biller("Amazon Prime", "Streaming Service", Icons.video_library),
        _biller("Spotify", "Music Subscription", Icons.music_note),
        _biller("Spotify", "Music Subscription", Icons.music_note),
        _biller("Amazon Prime", "Streaming Service", Icons.video_library),
      ],
    );
  }
}
