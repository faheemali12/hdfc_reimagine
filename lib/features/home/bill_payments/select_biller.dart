import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utills/colors.dart';
import 'details.screen.dart';

class SelectBiller extends StatelessWidget {
  final String billType;

  SelectBiller({required this.billType});

  final List<String> billers = [
    "Adani Electricity Mumbai Limited",
    "Ajmer Vidyut Vitran Nigam",
    "Assam Power",
    "Bangalore Electricity",
    "BEST Mumbai",
    "BSES Rajdhani",
    "BSES Rajdhani Prepaid Meter",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _horizontalStepper(1),  // Stepper with current step = 1
          SizedBox(height: 10),
          _buildSearchBar(),
          Expanded(child: _buildBillerList(context)),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBlue,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 20),
      ),
      title: Text(
        "Select Biller",
        style: TextStyle(color: AppColors.whiteGrey, fontSize: 22),
      ),
    );
  }

  Widget _horizontalStepper(int currentStep) {
    List<String> stepTitles = ["Type of Bill", "Select Biller", "Details", "Confirm"];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: List.generate(
              stepTitles.length,
                  (index) => Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: index <= currentStep ? Colors.blue : Colors.grey.shade400,
                      child: Icon(
                        index < currentStep ? Icons.check : Icons.circle,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                    if (index != stepTitles.length - 1)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: index < currentStep ? Colors.blue : Colors.grey.shade400,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              stepTitles.length,
                  (index) => Expanded(
                child: Center(
                  child: Text(
                    stepTitles[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search biller",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  Widget _buildBillerList(BuildContext context) {
    return ListView.separated(
      itemCount: billers.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.electric_bolt, color: AppColors.secondaryBlue),
          title: Text(billers[index]),
          subtitle: Text(billType),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  billerName: billers[index],
                  billerCategory: billType,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
