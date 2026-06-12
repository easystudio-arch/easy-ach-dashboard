import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/pos_inventory_data.dart';

final _currFmt = NumberFormat('#,##0', 'en_US');

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  String _selectedCategory = 'All';
  String _search = '';

  List<Product> get _filtered {
    return ProductStore.products.where((p) {
      final matchCat = _selectedCategory == 'All' || p.category == _selectedCategory;
      final matchSearch = p.name.toLowerCase().contains(_search.toLowerCase());
      return matchCat && matchSearch;
    }).toList();
  }

  void _showProductDialog({Product? product}) {
    final isEdit = product != null;
    final nameCtrl = TextEditingController(text: product?.name ?? '');
    final catCtrl = TextEditingController(text: product?.category ?? '');
    final priceCtrl = TextEditingController(text: product != null ? product.price.toString() : '');
    final stockCtrl = TextEditingController(text: product != null ? product.stock.toString() : '');
    final skuCtrl = TextEditingController(text: product?.sku ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isEdit ? 'Edit Product' : 'Add Product'),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name', isDense: true)),
            const SizedBox(height: 8),
            TextField(controller: catCtrl, decoration: const InputDecoration(labelText: 'Category', isDense: true)),
            const SizedBox(height: 8),
            TextField(controller: skuCtrl, decoration: const InputDecoration(labelText: 'SKU', isDense: true)),
            const SizedBox(height: 8),
            TextField(controller: priceCtrl, decoration: const InputDecoration(labelText: 'Price', isDense: true), keyboardType: TextInputType.number),
            const SizedBox(height: 8),
            TextField(controller: stockCtrl, decoration: const InputDecoration(labelText: 'Stock', isDense: true), keyboardType: TextInputType.number),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final p = Product(
                id: product?.id ?? ProductStore.nextId(),
                name: nameCtrl.text,
                category: catCtrl.text,
                price: double.tryParse(priceCtrl.text) ?? 0,
                stock: int.tryParse(stockCtrl.text) ?? 0,
                sku: skuCtrl.text,
              );
              setState(() { isEdit ? ProductStore.update(p) : ProductStore.add(p); });
              Navigator.pop(context);
            },
            child: Text(isEdit ? 'Save' : 'Add'),
          ),
        ],
      ),
    );
  }

  void _deleteProduct(Product p) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Delete "${p.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () { setState(() => ProductStore.delete(p.id)); Navigator.pop(context); },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final totalItems = ProductStore.products.fold<int>(0, (s, p) => s + p.stock);
    final lowStock = ProductStore.products.where((p) => p.stock < 25).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      floatingActionButton: FloatingActionButton(onPressed: () => _showProductDialog(), child: const Icon(Icons.add)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Wrap(spacing: 12, runSpacing: 12, children: [
            _SummaryChip(label: 'Total Products', value: '${ProductStore.products.length}', icon: Icons.inventory_2, color: cs.primary),
            _SummaryChip(label: 'Total Stock', value: _currFmt.format(totalItems), icon: Icons.warehouse, color: Colors.teal),
            _SummaryChip(label: 'Low Stock', value: '$lowStock', icon: Icons.warning_amber, color: Colors.orange),
          ]),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(hintText: 'Search product...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), isDense: true),
                onChanged: (v) => setState(() => _search = v),
              ),
            ),
            const SizedBox(width: 12),
            DropdownButton<String>(
              value: _selectedCategory,
              items: ['All', ...ProductStore.categories].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
            ),
          ]),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: _filtered.map((p) => ListTile(
                  dense: true,
                  title: Text(p.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  subtitle: Text('${p.sku} • ${p.category} • \$${_currFmt.format(p.price)}', style: const TextStyle(fontSize: 11)),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    _StockBadge(stock: p.stock),
                    const SizedBox(width: 8),
                    IconButton(icon: const Icon(Icons.edit, size: 18), onPressed: () => _showProductDialog(product: p)),
                    IconButton(icon: const Icon(Icons.delete, size: 18, color: Colors.red), onPressed: () => _deleteProduct(p)),
                  ]),
                )).toList(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _SummaryChip({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ]),
        ]),
      ),
    );
  }
}

class _StockBadge extends StatelessWidget {
  final int stock;
  const _StockBadge({required this.stock});

  @override
  Widget build(BuildContext context) {
    final color = stock < 20 ? Colors.red : stock < 40 ? Colors.orange : Colors.green;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Text('$stock', style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
    );
  }
}
