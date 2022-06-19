
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.image_url,
    required this.price,
    required this.description
  });

  final String id;
  final String name;
  final String image_url;
  final double price;
  final String description;

  factory Product.fromJson(Map<String, dynamic> json, [String? id]) {
    return Product(
      name: json['name'],
      price: json['price'].toDouble(),
      image_url: json['image_url'],
      description: json['description'],
      id: id ?? json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image_url': image_url,
      'description': description,
    };
  }
}