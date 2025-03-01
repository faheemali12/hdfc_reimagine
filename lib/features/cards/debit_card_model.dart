class DebitCardModel {
  final String cardTitle;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String balance;

  DebitCardModel({
    required this.cardTitle,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.balance,
  });
}
