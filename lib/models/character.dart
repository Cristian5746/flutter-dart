class Character {
  final String name;
  final String description;
  final String imageUrl;
  final int comicsCount;
  final int seriesCount;
  final int storiesCount;
  final int eventsCount;
  final List<String> firstThreeSeries;

  Character({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.comicsCount = 0,
    this.seriesCount = 0,
    this.storiesCount = 0,
    this.eventsCount = 0,
    this.firstThreeSeries = const [],
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'Nombre no disponible',
      description: json['description'] ?? 'Descripción no disponible',
      imageUrl:
          '${json['thumbnail']['path']}.${json['thumbnail']['extension']}',
      comicsCount: json['comics']['available'] ?? 0,
      seriesCount: json['series']['available'] ?? 0,
      storiesCount: json['stories']['available'] ?? 0,
      eventsCount: json['events']['available'] ?? 0,
      firstThreeSeries: _extractFirstThreeSeries(json['series']['items']),
    );
  }

  static List<String> _extractFirstThreeSeries(List<dynamic> seriesList) {
    final firstThreeSeries = <String>[];
    for (var i = 0; i < 3 && i < seriesList.length; i++) {
      final series = seriesList[i];
      final seriesName = series['name'];
      if (seriesName != null) {
        firstThreeSeries.add(seriesName);
      }
    }
    return firstThreeSeries;
  }
}
