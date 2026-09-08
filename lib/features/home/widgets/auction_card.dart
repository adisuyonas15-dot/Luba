import 'package:flutter/material.dart';

import 'countdown_timer.dart';
import '../../auctions/screens/auction_details_screen.dart';

class AuctionCard extends StatelessWidget {
  final String productName;
  final String productValue;
  final IconData imageIcon;
  final int hours;
  final int minutes;
  final int seconds;

  const AuctionCard({
    super.key,
    required this.productName,
    required this.productValue,
    required this.imageIcon,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(),

          const SizedBox(height: 12),

          Text(
            productName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'Value: $productValue',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),

          const Spacer(),

          Row(
            children: [
              const Icon(
                Icons.timer_outlined,
                size: 16,
                color: Colors.grey,
              ),

              const SizedBox(width: 5),

              CountdownTimer(
                hours: hours,
                minutes: minutes,
                seconds: seconds,
              ),
            ],
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuctionDetailsScreen(
                      productName: productName,
                      productValue: productValue,
                      productIcon: imageIcon,
                      hours: hours,
                      minutes: minutes,
                      seconds: seconds,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B3DF5),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Bid Now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F1FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              imageIcon,
              size: 70,
              color: const Color(0xFF5B3DF5),
            ),
          ),

          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'LIVE',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
