class Animate {
  final String id;
  final String image;
  final String name;

  Animate({
    this.id,
    this.image,
    this.name,
  });

  factory Animate.fromJson(Map<String, dynamic> json) {
    return Animate(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
    );
  }
}