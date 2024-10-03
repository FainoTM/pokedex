class Pokemon {
  final String name;
  final int id;
  final String sprite;
  final List<dynamic> abilities;

  Pokemon(
      {required this.name,
      required this.id,
      required this.sprite,
      required this.abilities
   });

  factory Pokemon.fromJson(Map<String, dynamic> json){
    List habil = [];
    for (var results in json['abilities']){
      habil.add(results['ability']['name']);
    }
    return Pokemon(name: json['name'], id: json['id'], sprite: json['sprites']['front_default'], abilities: habil);
  }
}
