class Surah {
  final int number;
  final int numberOfAyahs;
  final String name;
  final String translation;
  final String revelation;
  final String description;
  final String audio;

  Surah({
    required this.number,
    required this.numberOfAyahs,
    required this.name,
    required this.translation,
    required this.revelation,
    required this.description,
    required this.audio,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      numberOfAyahs: json['numberOfAyahs'],
      name: json['name'],
      translation: json['translation'],
      revelation: json['revelation'],
      description: json['description'],
      audio: json['audio'],
    );
  }
}