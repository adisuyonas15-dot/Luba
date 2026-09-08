import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int hours;
  final int minutes;
  final int seconds;
  final bool lightText;

  const CountdownTimer({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    this.lightText = false,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _remainingTime = Duration(
      hours: widget.hours,
      minutes: widget.minutes,
      seconds: widget.seconds,
    );

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (_remainingTime.inSeconds <= 0) {
          _timer?.cancel();
          return;
        }

        if (mounted) {
          setState(() {
            _remainingTime -= const Duration(seconds: 1);
          });
        }
      },
    );
  }

  String _twoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final hours = _remainingTime.inHours;
    final minutes = _remainingTime.inMinutes.remainder(60);
    final seconds = _remainingTime.inSeconds.remainder(60);

    return Text(
      '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}',
      style: TextStyle(
        color: widget.lightText
            ? Colors.white
            : const Color(0xFF222222),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
