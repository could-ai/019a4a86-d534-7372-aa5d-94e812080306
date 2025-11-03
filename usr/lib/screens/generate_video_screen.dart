import 'package:flutter/material.dart';

class GenerateVideoScreen extends StatefulWidget {
  const GenerateVideoScreen({super.key});

  @override
  State<GenerateVideoScreen> createState() => _GenerateVideoScreenState();
}

class _GenerateVideoScreenState extends State<GenerateVideoScreen> {
  final TextEditingController _scriptController = TextEditingController();
  String _selectedStyle = 'Cinematic';
  String _generationStatus = '';
  bool _isGenerating = false;

  final List<String> _styles = [
    'Cinematic',
    'Dashcam',
    'ASMR',
    'Educational',
    'Animated',
    'Cyberpunk',
  ];

  void _generateVideo() async {
    setState(() {
      _isGenerating = true;
      _generationStatus = 'Queued';
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _generationStatus = 'Rendering';
    });

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _generationStatus = 'Complete';
      _isGenerating = false;
    });

    // In real app, handle video download/share here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Script Input',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _scriptController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Enter your script or description...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Video Style',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedStyle,
                items: _styles.map((style) {
                  return DropdownMenuItem(
                    value: style,
                    child: Text(style),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStyle = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Preview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('Script and Style Preview Here'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isGenerating ? null : _generateVideo,
                child: Text(_isGenerating ? 'Generating...' : 'Generate Video'),
              ),
              const SizedBox(height: 20),
              if (_generationStatus.isNotEmpty)
                Text('Status: $_generationStatus'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scriptController.dispose();
    super.dispose();
  }
}