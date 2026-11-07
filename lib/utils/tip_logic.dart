/// Holds the output of a tip calculation.
class TipResult {
  final double tipAmount;
  final double totalAmount;
  final double perPerson;

  const TipResult({
    required this.tipAmount,
    required this.totalAmount,
    required this.perPerson,
  });
}

/// Calculates tip, total and per-person share.
TipResult calculateTip({
  required double bill,
  required double tipPercent,
  required int people,
}) {
  final safePeople = people < 1 ? 1 : people;
  final tip = bill * tipPercent / 100;
  final total = bill + tip;
  return TipResult(
    tipAmount: tip,
    totalAmount: total,
    perPerson: total / safePeople,
  );
}
