class TopPlaces {
	String? image;
	String? locationString;
	String? name;
	double? rating;

	TopPlaces({this.image, this.locationString, this.name, this.rating});

	factory TopPlaces.fromJson(Map<String, dynamic> json) => TopPlaces(
				image: json['image'] as String?,
				locationString: json['locationString'] as String?,
				name: json['name'] as String?,
				rating: (json['rating'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'image': image,
				'locationString': locationString,
				'name': name,
				'rating': rating,
			};
}
