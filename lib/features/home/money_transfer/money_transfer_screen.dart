import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/home/money_transfer/payee_profile.dart';

import '../../../utills/colors.dart';

class MoneyTransferScreen extends StatefulWidget {
  const MoneyTransferScreen({super.key});

  @override
  State<MoneyTransferScreen> createState() => _MoneyTransferScreenState();
}

class _MoneyTransferScreenState extends State<MoneyTransferScreen> {
  final TextEditingController _searchController = TextEditingController();

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Payees",
              style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            _addPayee(),
            SizedBox(height: 25),
            _payeeText(),
            SizedBox(height: 20),
            _searchField(),
            SizedBox(height: 20),
            _payeeList()
          ],
        ),
      ),
    );
  }

  Widget _addPayee() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              CupertinoIcons.plus,
              color: AppColors.secondaryBlue,
              size: 25,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(
            "Add Payee",
            style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _payeeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "All Payees",
          style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Icon(
          Icons.filter_alt,
          color: AppColors.darkGrey,
        )
      ],
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: _searchController,
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
          labelText: "Search Payee",
          hintText: "Search",
          labelStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _payees(String leading, String title, String subtitle, Color background) {
    return GestureDetector(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PayeeProfile()));
    },
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              leading,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
        title: Text(
          title,
          style:
              TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Icon(
          CupertinoIcons.right_chevron,
          color: AppColors.darkGrey,
        ),
      ),
    );
  }

  Widget _payeeList() {
    return Column(
      children: [
        _payees("HA", "Honda", "123456789", Colors.pink.shade100),
        _payees("RA", "Rikesh", "123456789", Colors.blue.shade100),
        _payees("SB", "Sadik Bhai", "123456789", Colors.orange.shade100),
        _payees("LL", "Lallu", "123456789", Colors.brown.shade100),
        _payees("AD", "Azruddin", "123456789", Colors.green.shade100),
        _payees("HA", "Honda", "123456789", Colors.pink.shade100),
      ],
    );
  }
}
