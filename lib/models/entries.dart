// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.data,
        this.categoryProducts,
    });

    List<Datum>? data;
    List<CategoryProduct>? categoryProducts;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        categoryProducts: json["category_products"] == null ? null : List<CategoryProduct>.from(json["category_products"].map((x) => CategoryProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "category_products": categoryProducts == null ? null : List<dynamic>.from(categoryProducts!.map((x) => x.toJson())),
    };
}

class CategoryProduct {
    CategoryProduct({
        this.categoryId,
        this.categoryName,
        this.price,
        this.description,
        this.categoryImage,
    });

    int? categoryId;
    String? categoryName;
    double? price;
    String? description;
    String? categoryImage;

    factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
        categoryId: json["category_id"] == null ? null : json["category_id"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        categoryImage: json["category_image"] == null ? null : json["category_image"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId == null ? null : categoryId,
        "category_name": categoryName == null ? null : categoryName,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "category_image": categoryImage == null ? null : categoryImage,
    };
}

class Datum {
    Datum({
        this.categoryId,
        this.categoryName,
    });

    int? categoryId;
    String? categoryName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"] == null ? null : json["category_id"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId == null ? null : categoryId,
        "category_name": categoryName == null ? null : categoryName,
    };
}
