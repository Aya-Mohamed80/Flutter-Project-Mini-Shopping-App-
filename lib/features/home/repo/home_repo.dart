import 'package:iti_project/features/home/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    try {
      final snapshot = await firestore.collection('products').get();
      return snapshot.docs
          .map((doc) => Product.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }
}
