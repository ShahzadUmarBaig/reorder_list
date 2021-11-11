class Movie {
  final int index;
  final String name;
  final int? number;
  final String id;

  Movie({
    required this.index,
    required this.name,
    required this.number,
    required this.id,
  });

  factory Movie.fromJson(String id, Map<String, dynamic> json) {
    return Movie(
      id: id,
      name: json['name'],
      index: json['index'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'index': index,
        'number': number,
      };
}
