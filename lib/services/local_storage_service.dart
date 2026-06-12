import 'dart:convert';
import 'package:web/web.dart' as web;
import '../data/pos_inventory_data.dart';

class LocalStorageService {
  static const _productsKey = 'pos_products';
  static const _settingsKey = 'pos_settings';

  static web.Storage get _storage => web.window.localStorage;

  // --- Products ---
  static List<Product> loadProducts() {
    final raw = _storage.getItem(_productsKey);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List;
    return list.map((m) => Product(
      id: m['id'], name: m['name'], category: m['category'],
      price: (m['price'] as num).toDouble(), stock: m['stock'] as int, sku: m['sku'],
    )).toList();
  }

  static void saveProducts(List<Product> products) {
    final list = products.map((p) => {
      'id': p.id, 'name': p.name, 'category': p.category,
      'price': p.price, 'stock': p.stock, 'sku': p.sku,
    }).toList();
    _storage.setItem(_productsKey, jsonEncode(list));
  }

  // --- Settings ---
  static Map<String, String> loadSettings() {
    final raw = _storage.getItem(_settingsKey);
    if (raw == null) return {'storeName': 'My Store', 'paperSize': '58'};
    return Map<String, String>.from(jsonDecode(raw));
  }

  static void saveSettings(Map<String, String> settings) {
    _storage.setItem(_settingsKey, jsonEncode(settings));
  }
}
