import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/pos_inventory_data.dart';
import '../services/receipt_service.dart';

final _currFmt = NumberFormat('#,##0.00', 'en_US');

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  final List<CartItem> _cart = [];
  String _selectedCategory = 'All';

  double get _total => _cart.fold(0, (s, i) => s + i.subtotal);

  List<Product> get _filtered {
    if (_selectedCategory == 'All') return PosInventoryData.products;
    return PosInventoryData.products.where((p) => p.category == _selectedCategory).toList();
  }

  void _addToCart(Product p) {
    setState(() {
      final idx = _cart.indexWhere((c) => c.product.id == p.id);
      if (idx >= 0) {
        _cart[idx].qty++;
      } else {
        _cart.add(CartItem(product: p));
      }
    });
  }

  void _removeFromCart(int idx) => setState(() => _cart.removeAt(idx));

  void _checkout() {
    if (_cart.isEmpty) return;
    showDialog(
      context: context,
      builder: (_) => _PaymentDialog(
        total: _total,
        onConfirm: (method) {
          ReceiptService.printReceipt(_cart, _total, paymentMethod: method);
          setState(() => _cart.clear());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Point of Sale')),
      body: LayoutBuilder(builder: (ctx, c) {
        if (c.maxWidth > 800) {
          return Row(children: [
            Expanded(flex: 3, child: _buildProductPanel()),
            SizedBox(width: 320, child: _buildCartPanel()),
          ]);
        }
        return Column(children: [
          Expanded(child: _buildProductPanel()),
          SizedBox(height: 280, child: _buildCartPanel()),
        ]);
      }),
    );
  }

  Widget _buildProductPanel() {
    return Column(children: [
      // Category filter
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
        child: SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: ['All', ...PosInventoryData.categories].map((cat) {
              final selected = cat == _selectedCategory;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(label: Text(cat), selected: selected, onSelected: (_) => setState(() => _selectedCategory = cat)),
              );
            }).toList(),
          ),
        ),
      ),
      // Product grid
      Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 180, childAspectRatio: 0.85, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: _filtered.length,
          itemBuilder: (_, i) => _ProductTile(product: _filtered[i], onTap: () => _addToCart(_filtered[i])),
        ),
      ),
    ]);
  }

  Widget _buildCartPanel() {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.grey.shade200))),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            Icon(Icons.shopping_cart, size: 20, color: cs.primary),
            const SizedBox(width: 8),
            Text('Cart (${_cart.fold<int>(0, (s, i) => s + i.qty)})', style: const TextStyle(fontWeight: FontWeight.w600)),
            const Spacer(),
            if (_cart.isNotEmpty) TextButton(onPressed: () => setState(() => _cart.clear()), child: const Text('Clear', style: TextStyle(fontSize: 12))),
          ]),
        ),
        const Divider(height: 1),
        Expanded(
          child: _cart.isEmpty
              ? const Center(child: Text('No items', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  itemCount: _cart.length,
                  itemBuilder: (_, i) {
                    final item = _cart[i];
                    return ListTile(
                      dense: true,
                      title: Text(item.product.name, style: const TextStyle(fontSize: 13)),
                      subtitle: Text('\$${_currFmt.format(item.product.price)} × ${item.qty}', style: const TextStyle(fontSize: 11)),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text('\$${_currFmt.format(item.subtotal)}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(width: 4),
                        InkWell(onTap: () => _removeFromCart(i), child: const Icon(Icons.close, size: 16, color: Colors.red)),
                      ]),
                    );
                  },
                ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text('\$${_currFmt.format(_total)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: cs.primary)),
            ]),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(onPressed: _cart.isEmpty ? null : _checkout, icon: const Icon(Icons.payment), label: const Text('Checkout')),
            ),
          ]),
        ),
      ]),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const _ProductTile({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.shopping_bag_outlined, size: 32, color: cs.primary),
            const SizedBox(height: 8),
            Text(product.name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text('\$${_currFmt.format(product.price)}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: cs.primary)),
            Text('Stock: ${product.stock}', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
          ]),
        ),
      ),
    );
  }
}


class _PaymentDialog extends StatefulWidget {
  final double total;
  final void Function(String method) onConfirm;
  const _PaymentDialog({required this.total, required this.onConfirm});

  @override
  State<_PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<_PaymentDialog> {
  String _selected = 'Cash';

  static const _methods = [
    {'name': 'Cash', 'icon': Icons.money},
    {'name': 'Transfer', 'icon': Icons.account_balance},
    {'name': 'QRIS', 'icon': Icons.qr_code},
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AlertDialog(
      title: const Text('Payment Method'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Total: \$${_currFmt.format(widget.total)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: cs.primary)),
        const SizedBox(height: 16),
        ..._methods.map((m) => RadioListTile<String>(
          title: Row(children: [
            Icon(m['icon'] as IconData, size: 20),
            const SizedBox(width: 8),
            Text(m['name'] as String),
          ]),
          value: m['name'] as String,
          groupValue: _selected,
          onChanged: (v) => setState(() => _selected = v!),
        )),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        FilledButton.icon(
          icon: const Icon(Icons.print),
          label: const Text('Pay & Print'),
          onPressed: () {
            Navigator.pop(context);
            widget.onConfirm(_selected);
          },
        ),
      ],
    );
  }
}
