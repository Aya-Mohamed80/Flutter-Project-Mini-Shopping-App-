class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromFirestore(Map<String, dynamic> data, String docId) {
    return Product(
      id: docId,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      imageUrl: data['imageUrl'] ?? '',
      
    );
  }
}
