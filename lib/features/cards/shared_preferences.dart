// Function to load card data
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> loadCardData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve card details from SharedPreferences
  String cardTitle = prefs.getString('cardTitle') ?? '';
  String cardNumber = prefs.getString('cardNumber') ?? '';
  String cardHolder = prefs.getString('cardHolder') ?? '';
  String expiryDate = prefs.getString('expiryDate') ?? '';
  String balance = prefs.getString('balance') ?? '';

  // Return a Map containing card details
  return {
    'cardTitle': cardTitle,
    'cardNumber': cardNumber,
    'cardHolder': cardHolder,
    'expiryDate': expiryDate,
    'balance': balance,
  };
}
