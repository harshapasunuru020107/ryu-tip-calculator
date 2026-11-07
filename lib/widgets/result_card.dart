import 'package:flutter/material.dart';
import '../utils/tip_logic.dart';

class ResultCard extends StatelessWidget {
  final TipResult result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      color: scheme.primaryContainer,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Each person pays',
              style: TextStyle(fontSize: 16, color: scheme.onPrimaryContainer),
            ),
            const SizedBox(height: 6),
            Text(
              '₹${result.perPerson.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: scheme.onPrimaryContainer,
              ),
            ),
            const Divider(height: 28),
            _row('Tip amount', result.tipAmount, scheme),
            const SizedBox(height: 8),
            _row('Total bill', result.totalAmount, scheme),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, double value, ColorScheme scheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, color: scheme.onPrimaryContainer)),
        Text('₹${value.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: scheme.onPrimaryContainer)),
      ],
    );
  }
}
