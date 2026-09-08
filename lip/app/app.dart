import 'package:flutter/material.dart';
import 'theme.dart';
import '../features/home/screens/home_screen.dart';

class AuctionApp extends StatelessWidget {
  const AuctionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lowest Bid',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
