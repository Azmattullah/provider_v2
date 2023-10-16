// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

import 'dart:convert';

List<ProductData> productDataFromJson(String str) => List<ProductData>.from(json.decode(str).map((x) => ProductData.fromJson(x)));

String productDataToJson(List<ProductData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductData {
    String price;
    String name;
    Rating rating;
    String image;
    int id;

    ProductData({
        required this.price,
        required this.name,
        required this.rating,
        required this.image,
        required this.id,
    });

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        price: json["price"],
        name: json["name"],
        rating: Rating.fromJson(json["rating"]),
        image: json["image"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "name": name,
        "rating": rating.toJson(),
        "image": image,
        "id": id,
    };
}

class Rating {
    double average;
    int reviews;

    Rating({
        required this.average,
        required this.reviews,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"].toDouble(),
        reviews: json["reviews"],
    );

    Map<String, dynamic> toJson() => {
        "average": average,
        "reviews": reviews,
    };
}
