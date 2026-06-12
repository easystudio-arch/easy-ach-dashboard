import '../services/local_storage_service.dart';

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final int stock;
  final String sku;

  Product({required this.id, required this.name, required this.category, required this.price, required this.stock, required this.sku});
}

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
  double get subtotal => product.price * qty;
}

class ProductStore {
  static List<Product> _products = [];

  static List<Product> get products => _products;
  static List<String> get categories => _products.map((p) => p.category).toSet().toList();

  static void init() {
    _products = LocalStorageService.loadProducts();
    if (_products.isEmpty) {
      _products = _defaultProducts;
      _save();
    }
  }

  static void add(Product p) { _products.add(p); _save(); }
  static void update(Product p) {
    final i = _products.indexWhere((x) => x.id == p.id);
    if (i >= 0) { _products[i] = p; _save(); }
  }
  static void delete(String id) { _products.removeWhere((x) => x.id == id); _save(); }
  static void _save() => LocalStorageService.saveProducts(_products);

  static String nextId() => DateTime.now().millisecondsSinceEpoch.toString();

  static final List<Product> _defaultProducts = [
    Product(id: '1', name: 'Wireless Headphones', category: 'Electronics', price: 150.00, stock: 45, sku: 'ELC-001'),
    Product(id: '2', name: 'Smart Watch Pro', category: 'Electronics', price: 300.00, stock: 28, sku: 'ELC-002'),
    Product(id: '3', name: 'Running Shoes X1', category: 'Sports', price: 150.00, stock: 62, sku: 'SPT-001'),
    Product(id: '4', name: 'Cotton T-Shirt Pack', category: 'Fashion', price: 50.00, stock: 120, sku: 'FSH-001'),
    Product(id: '5', name: 'LED Desk Lamp', category: 'Home & Garden', price: 80.00, stock: 35, sku: 'HMG-001'),
    Product(id: '6', name: 'Bluetooth Speaker', category: 'Electronics', price: 95.00, stock: 53, sku: 'ELC-003'),
    Product(id: '7', name: 'Yoga Mat Premium', category: 'Sports', price: 45.00, stock: 78, sku: 'SPT-002'),
    Product(id: '8', name: 'Denim Jacket', category: 'Fashion', price: 120.00, stock: 30, sku: 'FSH-002'),
    Product(id: '9', name: 'Coffee Maker', category: 'Home & Garden', price: 180.00, stock: 15, sku: 'HMG-002'),
    Product(id: '10', name: 'USB-C Hub', category: 'Electronics', price: 65.00, stock: 90, sku: 'ELC-004'),
    Product(id: '11', name: 'Tennis Racket', category: 'Sports', price: 85.00, stock: 22, sku: 'SPT-003'),
    Product(id: '12', name: 'Sunglasses Classic', category: 'Fashion', price: 70.00, stock: 48, sku: 'FSH-003'),
  ];
}

// Keep backward compat alias
class PosInventoryData {
  static List<Product> get products => ProductStore.products;
  static List<String> get categories => ProductStore.categories;
}
