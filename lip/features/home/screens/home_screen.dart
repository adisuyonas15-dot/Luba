import 'package:flutter/material.dart';

import '../widgets/featured_auction.dart';
import '../widgets/auction_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _navigationLabels = [
    'Home',
    'Auctions',
    'My Bids',
    'Wallet',
    'Profile',
  ];

  final List<IconData> _navigationIcons = [
    Icons.home_rounded,
    Icons.gavel_rounded,
    Icons.track_changes_rounded,
    Icons.account_balance_wallet_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildHomeContent(),
      ),

      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHomeContent() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          sliver: SliverToBoxAdapter(
            child: _buildHeader(),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
          sliver: SliverToBoxAdapter(
            child: _buildSearchBar(),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
          sliver: SliverToBoxAdapter(
            child: _buildSectionTitle(
              title: 'Featured Auction',
              action: 'See all',
            ),
          ),
        ),

        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 14, 20, 0),
          sliver: SliverToBoxAdapter(
            child: FeaturedAuction(),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          sliver: SliverToBoxAdapter(
            child: _buildSectionTitle(
              title: 'Live Auctions',
              action: 'See all',
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: _buildLiveAuctions(),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          sliver: SliverToBoxAdapter(
            child: _buildSectionTitle(
              title: 'Ending Soon',
              action: 'See all',
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: _buildEndingSoon(),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 30),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF5B3DF5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.gavel_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),

        const SizedBox(width: 12),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back 👋',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Find your next deal',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 25,
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search auctions...',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            Icons.tune_rounded,
            color: Color(0xFF5B3DF5),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle({
    required String title,
    required String action,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Text(
          action,
          style: const TextStyle(
            color: Color(0xFF5B3DF5),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildLiveAuctions() {
    return SizedBox(
      height: 320,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 14,
        ),
        children: const [
          AuctionCard(
            productName: 'iPhone 17 Pro',
            productValue: 'ETB 150,000',
            imageIcon: Icons.phone_iphone_rounded,
            hours: 2,
            minutes: 34,
            seconds: 18,
          ),

          SizedBox(width: 14),

          AuctionCard(
            productName: 'MacBook Pro',
            productValue: 'ETB 180,000',
            imageIcon: Icons.laptop_mac_rounded,
            hours: 1,
            minutes: 18,
            seconds: 42,
          ),

          SizedBox(width: 14),

          AuctionCard(
            productName: 'PlayStation 5',
            productValue: 'ETB 55,000',
            imageIcon: Icons.sports_esports_rounded,
            hours: 3,
            minutes: 12,
            seconds: 29,
          ),
        ],
      ),
    );
  }

  Widget _buildEndingSoon() {
    return SizedBox(
      height: 290,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 14,
        ),
        children: const [
          AuctionCard(
            productName: 'AirPods Pro',
            productValue: 'ETB 12,000',
            imageIcon: Icons.headphones_rounded,
            hours: 0,
            minutes: 12,
            seconds: 31,
          ),

          SizedBox(width: 14),

          AuctionCard(
            productName: 'Apple Watch',
            productValue: 'ETB 35,000',
            imageIcon: Icons.watch_rounded,
            hours: 0,
            minutes: 18,
            seconds: 42,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      height: 72,
      backgroundColor: Colors.white,
      indicatorColor: const Color(0xFFE8E3FF),
      destinations: List.generate(
        _navigationLabels.length,
        (index) {
          return NavigationDestination(
            icon: Icon(_navigationIcons[index]),
            selectedIcon: Icon(_navigationIcons[index]),
            label: _navigationLabels[index],
          );
        },
      ),
    );
  }
}
