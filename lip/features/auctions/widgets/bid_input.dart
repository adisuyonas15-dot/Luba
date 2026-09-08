import 'package:flutter/material.dart';

class BidInput extends StatefulWidget {
  final Function(double) onBidSubmitted;

  const BidInput({
    super.key,
    required this.onBidSubmitted,
  });

  @override
  State<BidInput> createState() => _BidInputState();
}

class _BidInputState extends State<BidInput> {
  final TextEditingController _controller =
      TextEditingController();

  void _submit() {
    final amount = double.tryParse(
      _controller.text.trim(),
    );

    if (amount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid amount.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    widget.onBidSubmitted(amount);

    _controller.clear();
  }

  void _addAmount(double amount) {
    final current =
        double.tryParse(_controller.text) ?? 0;

    final newAmount = current + amount;

    _controller.text = newAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter your bid',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: _controller,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          decoration: InputDecoration(
            prefixText: 'ETB ',
            hintText: '0.00',
            suffixIcon: IconButton(
              onPressed: () {
                _controller.clear();
              },
              icon: const Icon(Icons.clear),
            ),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            _quickButton(1),
            const SizedBox(width: 8),
            _quickButton(5),
            const SizedBox(width: 8),
            _quickButton(10),
            const SizedBox(width: 8),
            _quickButton(50),
          ],
        ),

        const SizedBox(height: 14),

        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5B3DF5),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'PLACE BID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _quickButton(double amount) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _addAmount(amount),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          side: const BorderSide(
            color: Color(0xFFDAD7E8),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          '+${amount.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
