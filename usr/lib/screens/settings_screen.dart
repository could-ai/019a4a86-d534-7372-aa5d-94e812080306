import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _apiKeyController = TextEditingController(text: 'your-sora2-api-key-here');
  String _selectedTier = 'Free';

  final List<String> _tiers = ['Free', 'Pro', 'Enterprise'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'API Configuration',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _apiKeyController,
                decoration: const InputDecoration(
                  labelText: 'Sora2 Pro API Key',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              const Text(
                'Subscription Tier',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedTier,
                items: _tiers.map((tier) {
                  return DropdownMenuItem(
                    value: tier,
                    child: Text(tier),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTier = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Placeholder for subscription upgrade
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Upgrading to $_selectedTier tier...')),
                  );
                },
                child: const Text('Upgrade Subscription'),
              ),
              const SizedBox(height: 40),
              const Text(
                'AI Prompt Optimization',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Automatically optimize prompts for better results: Enabled'),
              Switch(
                value: true, // Placeholder
                onChanged: (value) {
                  // Toggle AI optimization
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Video Enhancements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text('Add Subtitles'),
                value: false, // Placeholder
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: const Text('AI Voiceover'),
                value: true, // Placeholder
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: const Text('Background Music'),
                value: false, // Placeholder
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }
}