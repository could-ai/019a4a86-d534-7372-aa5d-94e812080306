import 'package:flutter/material.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  final List<Map<String, String>> _templates = const [
    {
      'title': 'Dashcam Car Crash',
      'description': 'Realistic dashcam footage of a car accident in urban setting',
      'prompt': 'High-quality dashcam video of a car crash on a rainy city street, realistic physics, 4K, 16:9',
    },
    {
      'title': 'Mystical Cave Explorer',
      'description': 'ASMR-style exploration of a mystical cave',
      'prompt': 'ASMR video of exploring a mystical cave with glowing crystals, soft whispers, 4K, 1:1',
    },
    {
      'title': 'Cyberpunk City Rain',
      'description': 'Cyberpunk cinematic with female narrator',
      'prompt': 'High-quality cyberpunk cinematic video, rainy neon street, depth of field, 4K, 16:9, with female AI voice-over in English',
    },
    {
      'title': 'Educational Science Lesson',
      'description': 'Animated educational content about science concepts',
      'prompt': 'Animated educational video explaining photosynthesis, colorful illustrations, 4K, 16:9',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Templates'),
      ),
      body: ListView.builder(
        itemCount: _templates.length,
        itemBuilder: (context, index) {
          final template = _templates[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(template['title']!),
              subtitle: Text(template['description']!),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to generate screen with pre-filled template
                  Navigator.pushNamed(
                    context,
                    '/generate',
                    arguments: template,
                  );
                },
                child: const Text('Use Template'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for creating custom template
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Custom template creation coming soon!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}