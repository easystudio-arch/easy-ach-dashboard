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
    return PosInventoryData.products.where((p) {
      final matchCat = _selectedCategory == 'All' || p.category == _selectedCategory;
      final matchSearch = p.name.toLowerCase().contains(_search.toLowerCase());
      return matchCat && matchSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final totalItems = PosInventoryData.products.fold<int>(0, (s, p) => s + p.stock);
    final lowStock = PosInventoryData.products.where((p) => p.stock < 25).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Summary cards
          Wrap(spacing: 12, runSpacing: 12, children: [
            _SummaryChip(label: 'Total Products', value: '${PosInventoryData.products.length}', icon: Icons.inventory_2, color: cs.primary),
            _SummaryChip(label: 'Total Stock', value: _currFmt.format(totalItems), icon: Icons.warehouse, color: Colors.teal),
            _SummaryChip(label: 'Low Stock', value: '$lowStock', icon: Icons.warning_amber, color: Colors.orange),
          ]),
          const SizedBox(height: 20),
          // Filters
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
              items: ['All', ...PosInventoryData.categories].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
            ),
          ]),
          const SizedBox(height: 16),
          // Product table
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Table(
                columnWidths: const {0: FlexColumnWidth(0.8), 1: FlexColumnWidth(2), 2: FlexColumnWidth(1.2), 3: FlexColumnWidth(1), 4: FlexColumnWidth(0.8)},
                children: [
                  const TableRow(children: [
                    Padding(padding: EdgeInsets.only(bottom: 10), child: Text('SKU', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12))),
                    Text('Product', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                    Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                    Text('Price', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                    Text('Stock', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  ]),
                  ..._filtered.map((p) => TableRow(children: [
                    Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(p.sku, style: const TextStyle(fontSize: 12, fontFamily: 'monospace'))),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(p.name, style: const TextStyle(fontSize: 13))),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(p.category, style: const TextStyle(fontSize: 13))),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text('\$${_currFmt.format(p.price)}', style: const TextStyle(fontSize: 13))),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: _StockBadge(stock: p.stock)),
                  ])),
                ],
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
