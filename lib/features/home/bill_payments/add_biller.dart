import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/home/bill_payments/select_biller.dart';
import '../../../utills/colors.dart';

class AddBiller extends StatefulWidget {
  const AddBiller({super.key});

  @override
  State<AddBiller> createState() => _AddBillerState();
}

class _AddBillerState extends State<AddBiller> {
  int _currentStep = 0;

  final List<String> stepTitles = [
    "Type of Bill",
    "Select Biller",
    "Details",
    "Confirm"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _horizontalStepper(),
          SizedBox(height: 25),
          Expanded(child: _stepContent()),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryBlue,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 20),
      ),
      title: Text(
        "Bill Payments",
        style: TextStyle(color: AppColors.whiteGrey, fontSize: 22),
      ),
    );
  }

  Widget _horizontalStepper() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              stepTitles.length,
              (index) => Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 30),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getStepColor(index),
                          ),
                          child: Center(
                            child: Icon(
                              index < _currentStep ? Icons.check : Icons.circle,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                        if (index != stepTitles.length - 1)
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 2,
                              color: index < _currentStep
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 6),
                    SizedBox(
                      width: 100,
                      child: Text(
                        stepTitles[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStepColor(int index) {
    if (index < _currentStep) return Colors.blue;
    if (index == _currentStep) return Colors.blue;
    return Colors.grey.shade400;
  }

  Widget _stepContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (_currentStep == 0) _billTypeSelection(),
          ],
        ),
      ),
    );
  }

  Widget _billTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _billCategory("Communications Bills", [
          _billTypeItem(Icons.phone_android, "Mobile\npostpaid"),
          _billTypeItem(Icons.phonelink_ring, "Landline\npostpaid"),
          _billTypeItem(Icons.wifi, "BB Postpaid"),
          _billTypeItem(Icons.tv, "Cable TV"),
        ]),
        SizedBox(height: 20),
        _billCategory("Utility Bills", [
          _billTypeItem(Icons.bolt, "Electricity"),
          _billTypeItem(Icons.local_gas_station, "Gas"),
          _billTypeItem(Icons.water_drop, "Water"),
          _billTypeItem(Icons.propane_tank, "LPG Cylinder"),
        ]),
        SizedBox(height: 20),
        _billCategory("Financial Bills", [
          _billTypeItem(Icons.security, "Insurance"),
          _billTypeItem(Icons.attach_money, "Loan"),
          _billTypeItem(Icons.credit_card, "Credit Card"),
          _billTypeItem(Icons.trending_up, "Mutual Fund"),
        ]),
        SizedBox(height: 20),
        _billCategory("Other Payments", [
          _billTypeItem(Icons.home, "Rental Payment"),
          _billTypeItem(Icons.request_page, "Tax"),
          _billTypeItem(Icons.directions_car, "Fastag"),
          _billTypeItem(Icons.school, "Education"),
        ]),
      ],
    );
  }

  Widget _billCategory(String title, List<Widget> billItems) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 30, // Increased spacing
              runSpacing: 15, // Increased run spacing
              children: billItems,
            ),
          ),
        ],
      ),
    );
  }

  Widget _billTypeItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentStep = 1;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectBiller(billType: label),
          ),
        );
      },
      child: Column(
        children: [
          Icon(icon, size: 28, color: AppColors.secondaryBlue),
          SizedBox(height: 5),
          SizedBox(
            width: 70,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
