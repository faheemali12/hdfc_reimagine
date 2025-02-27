import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utills/colors.dart';

class PayeeProfile extends StatefulWidget {
  const PayeeProfile({super.key});

  @override
  State<PayeeProfile> createState() => _PayeeProfileState();
}

class _PayeeProfileState extends State<PayeeProfile> {
  final TextEditingController _searchController = TextEditingController();
  String selected = "IMPS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 20),
        ),
        title: Text("MoneyTransfer",
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
          _heading(),
          SizedBox(height: 50),
          _paymentText(),
          SizedBox(height: 20),
          _paymentMethod(),
          SizedBox(height: 20),
          _payText(),
          SizedBox(height: 10),
          _payList(),
          _statementButton(),
        ],
      ),
    );
  }

  Widget _heading() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "HA",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Honda",
            style: TextStyle(
                color: AppColors.darkGrey, fontWeight: FontWeight.w800),
          ),
          Text(
            "ICICI BANK -1234 12** **** 7894",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text(
            "0",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGrey),
          ),
          SizedBox(
            width: 90,
            height: 50,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(5)],
              style: TextStyle(),
              controller: _searchController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(12)),
                labelText: "Add note",
                labelStyle: const TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _paymentText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Payment Mode",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: AppColors.darkGrey),
        ),
      ],
    );
  }

  Widget _paymentMethod() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ["IMPS", "NEFT", "VisaPay"].map((option) {
          bool isSelected = selected == option;

          return GestureDetector(
            onTap: () {
              setState(() => selected = option);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 110,
              padding: EdgeInsets.symmetric(vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade50 : Colors.white,
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey.shade400,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    option,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.blue.shade700 : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    option == "IMPS"
                        ? "Immediate"
                        : option == "NEFT"
                            ? "Within an hour"
                            : "Within 2 days",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _payText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Pay From",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: AppColors.darkGrey),
        ),
      ],
    );
  }

  Widget _payList() {
    return ListTile(
      leading:
          Icon(Icons.account_balance_outlined, color: AppColors.secondaryBlue),
      title: Text(
        "Savings Account 8901 6848 5729 54",
        style: TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      subtitle: Text(
        "Balance 75,000",
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.black,
      ),
    );
  }

  Widget _statementButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryBlue,
                  minimumSize: Size(double.infinity, 50)),
              onPressed: () {},
              child: Text(
                "Continue",
                style: TextStyle(
                    color: AppColors.whiteGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w200),
              )),
        ],
      ),
    );
  }
}
