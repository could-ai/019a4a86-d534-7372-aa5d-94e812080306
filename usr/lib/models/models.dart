// Placeholder for models

class VideoTemplate {
  final String title;
  final String description;
  final String prompt;

  VideoTemplate({
    required this.title,
    required this.description,
    required this.prompt,
  });

  factory VideoTemplate.fromMap(Map<String, String> map) {
    return VideoTemplate(
      title: map['title']!,
      description: map['description']!,
      prompt: map['prompt']!,
    );
  }
}

class GenerationHistory {
  final String id;
  final String title;
  final String status;
  final String date;
  final String url;
  final String ratio;

  GenerationHistory({
    required this.id,
    required this.title,
    required this.status,
    required this.date,
    required this.url,
    required this.ratio,
  });

  factory GenerationHistory.fromMap(Map<String, dynamic> map) {
    return GenerationHistory(
      id: map['id'],
      title: map['title'],
      status: map['status'],
      date: map['date'],
      url: map['url'],
      ratio: map['ratio'],
    );
  }
}

class User {
  final String id;
  final int credits;
  final String tier;
  final List<GenerationHistory> history;

  User({
    required this.id,
    required this.credits,
    required this.tier,
    required this.history,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      credits: map['credits'],
      tier: map['tier'],
      history: (map['history'] as List).map((item) => GenerationHistory.fromMap(item)).toList(),
    );
  }
}