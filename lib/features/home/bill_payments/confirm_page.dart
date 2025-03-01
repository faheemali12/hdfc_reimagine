import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/home/bill_payments/bill_payments_screen.dart';
import '../../../utills/colors.dart';

class ConfirmPage extends StatefulWidget {
  final String billerName;
  final String billerCategory;
  final String accountId;
  final bool isSmartPayEnabled;
  final String paymentMethod;

  const ConfirmPage({
    required this.billerName,
    required this.billerCategory,
    required this.accountId,
    required this.isSmartPayEnabled,
    required this.paymentMethod,
    Key? key,
  }) : super(key: key);

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  bool isTermsAccepted = false;
  void _showSuccessDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54, // Dim the background
      transitionDuration: Duration(milliseconds: 400), // Animation duration
      pageBuilder: (context, anim1, anim2) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOutBack, // Smooth pop-in effect
          ),
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/success_icon.png', height: 80), // Replace with your asset
                  SizedBox(height: 10),
                  Text("Biller Added", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: child,
        );
      },
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context); // Close Dialog
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BillPaymentsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 500), // Smooth fade effect
        ),
            (route) => false, // Remove all previous screens
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _horizontalStepper(3), // Last step in progress
              SizedBox(height: 15),
              Text("Confirm Payment", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          
              SizedBox(height: 15),
              _billerCard(),
              SizedBox(height: 15),
              _accountDetails(),
              SizedBox(height: 15),
              _buildSmartPayToggle(),
              SizedBox(height: 15),
              _payFromSection(),
              SizedBox(height: 10),
          
              _termsAndConditions(),
              _buildConfirmButton(),
            ],
          ),
        ),
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
        "Confirm Payment",
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

  Widget _billerCard() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.electric_bolt, color: AppColors.primaryBlue, size: 30),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.billerName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(widget.billerCategory, style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _accountDetails() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailRow("Account ID", widget.accountId),
          _detailRow("Name of Biller", widget.billerName),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  Widget _buildSmartPayToggle() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enable Smart Pay", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Bills will be debited 4 days before the due date once they are generated.",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Switch(
            value: widget.isSmartPayEnabled,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _payFromSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pay From", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Icon(Icons.account_balance, color: AppColors.primaryBlue, size: 30),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.paymentMethod, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text("Selected Payment Method", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _termsAndConditions() {
    return Row(
      children: [
        Checkbox(
          value: isTermsAccepted,
          onChanged: (value) {
            setState(() {
              isTermsAccepted = value!;
            });
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: "I accept the ",
              style: TextStyle(fontSize: 14),
              children: [
                TextSpan(
                  text: "Terms and Conditions",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: isTermsAccepted ? () {
      _showSuccessDialog();
      } : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isTermsAccepted ? AppColors.primaryBlue : Colors.grey.shade400,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text("Confirm", style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
