import 'package:flutter/material.dart';
import '../screens/generate_video_screen.dart';

class CustomWidgets {
  static Widget buildVideoPreview(String script, String style) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Script: $script', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Text('Style: $style', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          const Text('Generated Prompt Preview:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('High-quality $style video, $script, 4K, optimized for Sora2 Pro'),
        ],
      ),
    );
  }

  static Widget buildStatusIndicator(String status) {
    Color color;
    switch (status) {
      case 'Queued':
        color = Colors.yellow;
        break;
      case 'Rendering':
        color = Colors.orange;
        break;
      case 'Complete':
        color = Colors.green;
        break;
      case 'Failed':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 16),
        const SizedBox(width: 8),
        Text(status),
      ],
    );
  }
}