import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<Map<String, dynamic>> _history = const [
    {
      'title': 'Cyberpunk City Rain',
      'status': 'Complete',
      'date': '2023-10-01',
      'url': 'https://example.com/video1.mp4',
      'ratio': '16:9',
    },
    {
      'title': 'Dashcam Crash',
      'status': 'Complete',
      'date': '2023-09-28',
      'url': 'https://example.com/video2.mp4',
      'ratio': '9:16',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generation History'),
      ),
      body: ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final item = _history[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              title: Text(item['title']),
              subtitle: Text('Status: ${item['status']} | Date: ${item['date']}'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ratio: ${item['ratio']}'),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Placeholder for download
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Download started!')),
                              );
                            },
                            child: const Text('Download'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Placeholder for share
                              Share.share(item['url']);
                            },
                            child: const Text('Share'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Show QR code dialog
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Share QR Code'),
                                  content: QrImageView(
                                    data: item['url'],
                                    version: QrVersions.auto,
                                    size: 200.0,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text('QR Code'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}