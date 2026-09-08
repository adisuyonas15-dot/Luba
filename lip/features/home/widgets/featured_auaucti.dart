import 'package:flutter/material.dart';

import 'countdown_timer.dart';

class FeaturedAuction extends StatelessWidget {
  const FeaturedAuction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        color: const Color(0xFF19162B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -25,
            top: 20,
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                color: const Color(0xFF302A50),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLiveBadge(),

                const SizedBox(height: 18),

                const Text(
                  'iPhone 17 Pro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Premium smartphone',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),

                const Spacer(),

                Row(
                  children: [
                    const Icon(
                      Icons.sell_outlined,
                      color: Colors.white70,
                      size: 18,
                    ),

                    const SizedBox(width: 7),

                    const Text(
                      'Retail value',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),

                    const Spacer(),

                    const Text(
                      'ETB 150,000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.white70,
                        size: 18,
                      ),

                      SizedBox(width: 8),

                      Text(
                        'Ends in',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),

                      Spacer(),

                      CountdownTimer(
                        hours: 2,
                        minutes: 34,
                        seconds: 18,
                        lightText: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7257FF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Place a Bid',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: Colors.red,
            size: 8,
          ),

          SizedBox(width: 6),

          Text(
            'LIVE AUCTION',
            style: TextStyle(
              color: Colors.red,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
