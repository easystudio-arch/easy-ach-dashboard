import 'package:flutter/material.dart';
import '../services/local_storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _storeNameCtrl;
  late String _paperSize;

  @override
  void initState() {
    super.initState();
    final s = LocalStorageService.loadSettings();
    _storeNameCtrl = TextEditingController(text: s['storeName'] ?? 'My Store');
    _paperSize = s['paperSize'] ?? '58';
  }

  void _save() {
    LocalStorageService.saveSettings({'storeName': _storeNameCtrl.text, 'paperSize': _paperSize});
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Settings saved'), duration: Duration(seconds: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Store Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                TextField(
                  controller: _storeNameCtrl,
                  decoration: const InputDecoration(labelText: 'Store Name', border: OutlineInputBorder(), isDense: true),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Printer Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                const Text('Paper Size', style: TextStyle(fontSize: 13)),
                const SizedBox(height: 8),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: '58', label: Text('58mm'), icon: Icon(Icons.receipt)),
                    ButtonSegment(value: '80', label: Text('80mm'), icon: Icon(Icons.receipt_long)),
                  ],
                  selected: {_paperSize},
                  onSelectionChanged: (v) => setState(() => _paperSize = v.first),
                ),
                const SizedBox(height: 8),
                Text(_paperSize == '58' ? 'Thermal printer kecil (32 char/line)' : 'Thermal printer standar (48 char/line)',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ]),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(onPressed: _save, icon: const Icon(Icons.save), label: const Text('Save Settings')),
        ],
      ),
    );
  }

  @override
  void dispose() { _storeNameCtrl.dispose(); super.dispose(); }
}
