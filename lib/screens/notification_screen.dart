import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const NotificationScreen({
    Key? key,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Notification Screen',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            'Count: $count',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onIncrease,
            child: const Text('Increase Count'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onDecrease,
            child: const Text('Decrease Count'),
          ),
        ],
      ),
    );
  }
}
