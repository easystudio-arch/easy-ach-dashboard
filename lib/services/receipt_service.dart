import 'dart:js_interop';
import 'package:web/web.dart' as web;
import 'package:intl/intl.dart';
import '../data/pos_inventory_data.dart';
import 'local_storage_service.dart';

class ReceiptService {
  static final _currFmt = NumberFormat('#,##0.00', 'en_US');
  static final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

  static void printReceipt(List<CartItem> items, double total) {
    final settings = LocalStorageService.loadSettings();
    final storeName = settings['storeName'] ?? 'My Store';
    final paperSize = settings['paperSize'] ?? '58';
    final charWidth = paperSize == '58' ? 32 : 48;
    final widthMm = paperSize == '58' ? '58mm' : '80mm';

    final lines = <String>[];
    lines.add(_center(storeName, charWidth));
    lines.add(_repeat('-', charWidth));
    lines.add(_dateFmt.format(DateTime.now()));
    lines.add(_repeat('-', charWidth));

    for (final item in items) {
      final name = item.product.name.length > charWidth - 10
          ? item.product.name.substring(0, charWidth - 10)
          : item.product.name;
      lines.add(name);
      lines.add(_padBoth('  ${item.qty} x \$${_currFmt.format(item.product.price)}', '\$${_currFmt.format(item.subtotal)}', charWidth));
    }

    lines.add(_repeat('-', charWidth));
    lines.add(_padBoth('TOTAL', '\$${_currFmt.format(total)}', charWidth));
    lines.add(_repeat('=', charWidth));
    lines.add(_center('Thank you!', charWidth));

    _printHtml(lines, widthMm);
  }

  static String _center(String s, int w) => s.length >= w ? s : s.padLeft((w + s.length) ~/ 2).padRight(w);
  static String _repeat(String c, int w) => c * w;
  static String _padBoth(String left, String right, int w) {
    final gap = w - left.length - right.length;
    return left + ' ' * (gap > 0 ? gap : 1) + right;
  }

  static void _printHtml(List<String> lines, String width) {
    final content = lines.map((l) => l.replaceAll(' ', '&nbsp;')).join('<br>');
    final html = '''
<!DOCTYPE html><html><head><style>
@page { size: $width auto; margin: 2mm; }
body { font-family: monospace; font-size: 10px; line-height: 1.4; margin: 0; }
@media print { body { width: $width; } }
</style></head><body>$content</body></html>''';

    final printWindow = web.window.open('', '_blank');
    if (printWindow != null) {
      printWindow.document.write(html.toJS);
      printWindow.document.close();
      printWindow.focus();
      printWindow.print();
    }
  }
}
