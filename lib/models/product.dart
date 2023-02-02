/// Product model
///
/// This model is used to store the product data.
///
/// This model is immutable, which means that once an instance of this class is created, it cannot be changed.
///
/// This model is also serializable, which means that it can be converted to and from JSON.
///
/// This model is also comparable, which means that it can be compared to other instances of this class.
///
/// This model is also copyable, which means that it can be copied with some of the properties changed.
///
/// This model is also hashable, which means that it can be used as a key in a hash map.
///
/// This model is also equatable, which means that it can be compared to other instances of this class.
///
/// This model is also printable, which means that it can be printed.
class Product {
  final String id;
  final String img;
  final double price;
  final String title;
  final String description;

  const Product({
    required this.id,
    required this.img,
    required this.price,
    required this.title,
    required this.description,
  });

  /// This method is used to create a new instance of this class from a JSON object.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      img: json['img'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
    );
  }

  /// This method is used to convert this instance of this class to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'price': price,
      'title': title,
      'description': description,
    };
  }

  /// This method is used to create a new instance of this class from another instance of this class.
  Product copyWith({
    String? id,
    String? img,
    double? price,
    String? title,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      img: img ?? this.img,
      price: price ?? this.price,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  /// This method is used to print this instance of this class.
  @override
  String toString() {
    return 'Product(id: $id, img: $img, price: $price, title: $title, description: $description)';
  }

  /// This method is used to compare this instance of this class to another instance of this class.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.img == img &&
        other.price == price &&
        other.title == title &&
        other.description == description;
  }

  /// This method is used to get the hash code of this instance of this class.
  @override
  int get hashCode {
    return id.hashCode ^
        img.hashCode ^
        price.hashCode ^
        title.hashCode ^
        description.hashCode;
  }
}
