import 'package:flutter/material.dart';

import '../widgets/bid_input.dart';
import '../widgets/my_bid_list.dart';

class AuctionDetailsScreen extends StatefulWidget {
  final String productName;
  final String productValue;
  final IconData productIcon;
  final int hours;
  final int minutes;
  final int seconds;

  const AuctionDetailsScreen({
    super.key,
    required this.productName,
    required this.productValue,
    required this.productIcon,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  State<AuctionDetailsScreen> createState() =>
      _AuctionDetailsScreenState();
}

class _AuctionDetailsScreenState
    extends State<AuctionDetailsScreen> {
  final List<double> _myBids = [];

  void _placeBid(double amount) {
    if (amount <= 0) {
      _showMessage('Enter a valid bid amount.');
      return;
    }

    if (_myBids.length >= 100) {
      _showMessage('You have reached the 100-bid limit.');
      return;
    }

    if (_myBids.contains(amount)) {
      _showMessage('You already submitted this bid.');
      return;
    }

    setState(() {
      _myBids.add(amount);
    });

    _showMessage(
      'Bid of ETB ${amount.toStringAsFixed(2)} submitted!',
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        title: const Text(
          'Auction Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            10,
            20,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(),

              const SizedBox(height: 22),

              _buildProductInformation(),

              const SizedBox(height: 20),

              _buildAuctionTimer(),

              const SizedBox(height: 24),

              _buildBidCounter(),

              const SizedBox(height: 20),

              BidInput(
                onBidSubmitted: _placeBid,
              ),

              const SizedBox(height: 28),

              _buildMyBidsHeader(),

              const SizedBox(height: 12),

              MyBidList(
                bids: _myBids,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAFF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              widget.productIcon,
              size: 120,
              color: const Color(0xFF5B3DF5),
            ),
          ),

          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 11,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 7,
                    color: Colors.white,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.productName,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          'Premium product auction',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 18),

        Row(
          children: [
            _infoBox(
              icon: Icons.sell_outlined,
              title: 'Retail Value',
              value: widget.productValue,
            ),

            const SizedBox(width: 12),

            _infoBox(
              icon: Icons.people_outline_rounded,
              title: 'Participants',
              value: '1,248',
            ),
          ],
        ),
      ],
    );
  }

  Widget _infoBox({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 20,
              color: const Color(0xFF5B3DF5),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuctionTimer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF19162B),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Text(
            'AUCTION ENDS IN',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 10),

          _CountdownDisplay(
            hours: widget.hours,
            minutes: widget.minutes,
            seconds: widget.seconds,
          ),
        ],
      ),
    );
  }

  Widget _buildBidCounter() {
    final remaining = 100 - _myBids.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF5B3DF5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.gavel_rounded,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your bids',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Maximum 100 bids per auction',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Text(
            '${_myBids.length}/100',
            style: const TextStyle(
              color: Color(0xFF5B3DF5),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyBidsHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Your Submitted Bids',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Text(
          '${_myBids.length} bids',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _CountdownDisplay extends StatefulWidget {
  final int hours;
  final int minutes;
  final int seconds;

  const _CountdownDisplay({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  State<_CountdownDisplay> createState() =>
      _CountdownDisplayState();
}

class _CountdownDisplayState
    extends State<_CountdownDisplay> {
  late Duration _remaining;
  late final Stream<int> _ticker;

  @override
  void initState() {
    super.initState();

    _remaining = Duration(
      hours: widget.hours,
      minutes: widget.minutes,
      seconds: widget.seconds,
    );

    _ticker = Stream.periodic(
      const Duration(seconds: 1),
      (count) => count,
    );

    _ticker.listen((_) {
      if (!mounted) return;

      if (_remaining.inSeconds > 0) {
        setState(() {
          _remaining -= const Duration(seconds: 1);
        });
      }
    });
  }

  String _twoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final h = _remaining.inHours;
    final m = _remaining.inMinutes.remainder(60);
    final s = _remaining.inSeconds.remainder(60);

    return Text(
      '${_twoDigits(h)} : ${_twoDigits(m)} : ${_twoDigits(s)}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }
}
