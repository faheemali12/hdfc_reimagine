import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../../../utills/colors.dart';

class CreditcardScreen extends StatefulWidget {
  const CreditcardScreen({super.key});

  @override
  State<CreditcardScreen> createState() => _CreditcardScreenState();
}

class _CreditcardScreenState extends State<CreditcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          "Credit Card Summary",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: _builBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _builBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            _heading(),
            SizedBox(height: 10),
            _creditCard(),
            SizedBox(height: 25),
            _creditTotal(),
            SizedBox(height: 25),
            _reward(),
            SizedBox(height: 25),
            _billText(),
            SizedBox(height: 20),
            _creditBills(),
            SizedBox(height: 25),
            _linkedLoans(),
            SizedBox(height: 5),
            _loans(),
            SizedBox(height: 25),
            _actionText(),
            SizedBox(height: 10),
            _action()
          ],
        ),
      ),
    );
  }

  Widget _heading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Credit Cards",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        PopupMenuButton<int>(
          color: Colors.white,
          icon: Icon(Icons.more_vert_sharp, color: Colors.black),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.primaryBlue),
                  SizedBox(width: 10),
                  Text("Add Card"),
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(Icons.edit, color: AppColors.primaryBlue),
                  SizedBox(width: 10),
                  Text("Change PIN"),
                ],
              ),
            ),
            PopupMenuItem(
              value: 3,
              child: Row(
                children: [
                  Icon(Icons.block, color: AppColors.primaryBlue),
                  SizedBox(width: 10),
                  Text("Block"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _creditCard() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreditcardScreen()));
        },
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black, AppColors.darkGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PLATINIUM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "BALANCE",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        "₹9,70,500",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "6795  ****  ****  5673",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD HOLDER NAME",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        "JOHN REGO",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "VALID",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        "06/24",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Visa",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _creditTotal() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Running Credit",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rs.75,500",
                  style: TextStyle(
                      color: AppColors.darkGrey, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Unbilled Amount",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rs.5,500",
                  style: TextStyle(
                      color: AppColors.darkGrey, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: AppColors.lightGrey,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "View More",
                  style: TextStyle(
                      color: AppColors.secondaryBlue,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  color: AppColors.secondaryBlue,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _reward() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: ListTile(
        leading: Image.asset(
          "assets/icons/trophy.png",
          color: AppColors.secondaryBlue,
          height: 25,
        ),
        title: Text(
          "Reedem Reward Points",
          style: TextStyle(fontSize: 13, color: AppColors.darkGrey),
        ),
        subtitle: Text(
          "26,500",
          style: TextStyle(
              fontSize: 20,
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w600),
        ),
        trailing: Icon(CupertinoIcons.right_chevron),
      ),
    );
  }

  Widget _billText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Credit Card Bills",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _creditBills() {
    final _controller = ValueNotifier<bool>(false);
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightGrey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last Statement Amount",
                  style: TextStyle(color: AppColors.darkGrey, fontSize: 14),
                ),
                Text(
                  "₹80,000",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Due On",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 14)),
                    SizedBox(height: 4),
                    Text("09 June 2023",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Minimum Due",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 14)),
                    SizedBox(height: 4),
                    Text("₹0.00",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.lightGrey),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Autopay",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    AdvancedSwitch(
                      controller: _controller,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text("Pay",
                    style: TextStyle(fontSize: 18, color: AppColors.whiteGrey)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _linkedLoans() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Linked Loans",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _loans() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.lightGrey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "MONTHLY INSTALLMENT",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 4),
            const Text("₹8,450",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGrey)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("LOAN NUMBER",
                        style:
                            TextStyle(fontSize: 12, color: AppColors.darkGrey)),
                    Text("00000000000004578",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text("LOAN TYPE",
                        style:
                            TextStyle(fontSize: 12, color: AppColors.darkGrey)),
                    Text("SMARTEMI",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGrey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1, color: AppColors.lightGrey),
            const SizedBox(height: 10),
            const Text(
              "MONTHLY INSTALLMENT",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 4),
            const Text("₹9,120",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGrey)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("LOAN NUMBER",
                        style:
                            TextStyle(fontSize: 12, color: AppColors.darkGrey)),
                    Text("00000000000007845",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text("LOAN TYPE",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text("INSTALOAN",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1, color: AppColors.lightGrey),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View all",
                    style: TextStyle(
                        color: AppColors.secondaryBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  color: AppColors.secondaryBlue,
                  size: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Actions",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _actionList(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon,color: AppColors.secondaryBlue,),
      title: Text(
        title,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: AppColors.darkGrey,
      ),
    );
  }

  Widget _action(){
    return Column(
      children: [
      _actionList(CupertinoIcons.creditcard, "Pay Other Bank Credit Card"),
      _actionList(CupertinoIcons.plus_rectangle, "Request Add on Card"),
      _actionList(Icons.download, "Dowonload Billed Statement"),
      ],
    );
  }
}
