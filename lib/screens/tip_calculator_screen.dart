import 'package:flutter/material.dart';
import '../utils/tip_logic.dart';
import '../widgets/result_card.dart';

class TipCalculatorScreen extends StatefulWidget {
  const TipCalculatorScreen({super.key});

  @override
  State<TipCalculatorScreen> createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  final TextEditingController _billController = TextEditingController();
  double _tipPercent = 15;
  int _people = 1;

  @override
  void dispose() {
    _billController.dispose();
    super.dispose();
  }

  double get _bill => double.tryParse(_billController.text) ?? 0;

  void _reset() {
    setState(() {
      _billController.clear();
      _tipPercent = 15;
      _people = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = calculateTip(
      bill: _bill,
      tipPercent: _tipPercent,
      people: _people,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ryu • Tip Calculator'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Reset',
            icon: const Icon(Icons.refresh),
            onPressed: _reset,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _billController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Bill amount',
                prefixIcon: const Icon(Icons.currency_rupee),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tip',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Text('${_tipPercent.round()}%',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Slider(
              value: _tipPercent,
              min: 0,
              max: 30,
              divisions: 30,
              label: '${_tipPercent.round()}%',
              onChanged: (v) => setState(() => _tipPercent = v),
            ),
            Wrap(
              spacing: 8,
              children: [5, 10, 15, 20].map((p) {
                return ChoiceChip(
                  label: Text('$p%'),
                  selected: _tipPercent.round() == p,
                  onSelected: (_) =>
                      setState(() => _tipPercent = p.toDouble()),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Split between',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: _people > 1
                          ? () => setState(() => _people--)
                          : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('$_people',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    IconButton.filledTonal(
                      onPressed: () => setState(() => _people++),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            ResultCard(result: result),
          ],
        ),
      ),
    );
  }
}
