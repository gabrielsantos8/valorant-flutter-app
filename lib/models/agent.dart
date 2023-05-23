class Agent {
  String code;
  String name;
  String description;
  String icon;
  String image;
  String background;
  List gradientColor;
  List abilities;

  Agent(
      {required this.code,
      required this.name,
      required this.icon,
      required this.image,
      required this.background,
      required this.gradientColor,
      required this.description,
      required this.abilities});

  factory Agent.fromMap(Map<String, dynamic> mapa) {
    return Agent(
        code: mapa['uuid'],
        name: mapa['displayName'] ?? '',
        icon: mapa['displayIcon'] ?? '',
        image: mapa['fullPortrait'] ?? '',
        background: mapa['background'] ?? '',
        gradientColor: mapa['backgroundGradientColors'] ?? [],
        description: mapa['description'] ?? '',
        abilities: mapa['abilities'] ?? []);
  }
}
