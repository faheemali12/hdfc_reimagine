import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/home/bill_payments/confirm_page.dart';
import '../../../utills/colors.dart';

class DetailsScreen extends StatefulWidget {
  final String billerName;
  final String billerCategory;

  const DetailsScreen(
      {required this.billerName, required this.billerCategory, Key? key})
      : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController _accountIdController = TextEditingController();
  final TextEditingController _billerNameController = TextEditingController();
  bool isSmartPayEnabled = false;
  String selectedPaymentMethod = "Savings Account";

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showPayNowDialog(String billerName, String billerCategory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Pay Now",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Divider(color: Colors.grey.shade300, thickness: 1),
                const SizedBox(height: 5),
                const Text(
                    "Would you like to make a payment while we add your biller?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)),
                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/electricity_icon.png',
                          height: 40),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(billerName,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(billerCategory,
                              style: TextStyle(color: Colors.grey.shade600)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Enter amount",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                ),
                const SizedBox(height: 20),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          side: const BorderSide(color: Colors.blue),
                        ),
                        child:
                            const Text("Skip", style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle payment logic here
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Pay Bill"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Prevent automatic resizing
        appBar: _buildAppBar(context),
        body:
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                _horizontalStepper(2), // Stepper at top
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _billerCard(),
                            const SizedBox(height: 20),
                            _buildTextField("Account ID", _accountIdController),
                            _buildTextField(
                                "Name this Biller", _billerNameController),
                            _buildSmartPayToggle(),
                            const SizedBox(height: 20),
                            _payFromSection(),
                            const Spacer(), // Pushes the button to the bottom
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildContinueButton(),
                  ),
                ),
              ],
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBlue,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 20),
      ),
      title: const Text(
        "Biller Details",
        style: TextStyle(color: AppColors.whiteGrey, fontSize: 22),
      ),
    );
  }

  Widget _horizontalStepper(int currentStep) {
    List<String> stepTitles = [
      "Type of Bill",
      "Select Biller",
      "Details",
      "Confirm"
    ];

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
                      backgroundColor: index <= currentStep
                          ? Colors.blue
                          : Colors.grey.shade400,
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
                          color: index < currentStep
                              ? Colors.blue
                              : Colors.grey.shade400,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              stepTitles.length,
              (index) => Expanded(
                child: Center(
                  child: Text(
                    stepTitles[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.electric_bolt, color: AppColors.primaryBlue, size: 30),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.billerName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(widget.billerCategory,
                  style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmartPayToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Enable Smart Pay",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text(
                  "Bills will be debited 4 days before the due date once they are generated.",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Switch(
            value: isSmartPayEnabled,
            onChanged: (value) {
              setState(() {
                isSmartPayEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _payFromSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pay From",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _paymentOption(
            "Savings Account", "Balance ₹7,500", Icons.account_balance),
        _paymentOption("VISA Platinum Debit Card", "6795 **** **** 5673",
            Icons.credit_card),
        _paymentOption("Credit Card", "**** **** **** 1234", Icons.credit_card),
      ],
    );
  }

  Widget _paymentOption(String title, String subtitle, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = title; // Update the selected payment method
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selectedPaymentMethod == title
              ? Colors.blue.shade100
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryBlue, size: 30),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style:
                        TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmPage(
                billerName: widget.billerName,
                // Pass actual biller name
                billerCategory: widget.billerCategory,
                // Pass actual category
                accountId: _accountIdController.text,
                // Pass user-entered account ID
                isSmartPayEnabled: isSmartPayEnabled,
                // Pass SmartPay toggle value
                paymentMethod:
                    selectedPaymentMethod, // Pass selected payment method
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text("Continue",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
