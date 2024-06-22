class RecommendedPlaces {
  String? image;
  String? locationString;
  String? name;
  double? rating;

  RecommendedPlaces({
    this.image,
    this.locationString,
    this.name,
    this.rating,
  });

  factory RecommendedPlaces.fromJson(Map<String, dynamic> json) {
    return RecommendedPlaces(
      image: json['image'] as String?,
      locationString: json['locationString'] as String?,
      name: json['name'] as String?,
      rating: json['rating'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'locationString': locationString,
        'name': name,
        'rating': rating,
      };
}
