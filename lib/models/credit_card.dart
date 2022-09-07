class CreditCard {
  final String name;
  final bool isVisa;
  final String holderName;
  final num cardNumber;
  final DateTime expirationDate;
  final int cvv;

  CreditCard({
    required this.name,
    required this.isVisa,
    required this.holderName,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvv,
  });
}
