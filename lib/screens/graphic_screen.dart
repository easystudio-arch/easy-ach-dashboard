import 'package:flutter/material.dart';
import '../services/progress_service.dart';

class GraphicScreen extends StatelessWidget {
  const GraphicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = ProgressService.getProgressHistory();
    final current = ProgressService.vocabCompleted + ProgressService.grammarCompleted + ProgressService.readingCompleted + ProgressService.listeningCompleted;

    // Ensure today's data is included
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (history.isEmpty || history.last['date'] != today) {
      history.add({'date': today, 'total': current});
    }

    final trend = history.length >= 2 ? (history.last['total'] as int) - (history[history.length - 2]['total'] as int) : 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Progress Trend')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(trend >= 0 ? Icons.trending_up : Icons.trending_down, size: 36, color: trend >= 0 ? Colors.green : Colors.red),
                const SizedBox(width: 8),
                Text(
                  trend >= 0 ? 'Progress Up (+$trend)' : 'Progress Down ($trend)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: trend >= 0 ? Colors.green : Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Total activities completed: $current', style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 24),
            Expanded(
              child: history.length < 2
                  ? const Center(child: Text('Study more days to see your trend chart!\nGrafik akan muncul setelah 2+ hari belajar.', textAlign: TextAlign.center))
                  : CustomPaint(size: Size.infinite, painter: _ChartPainter(history)),
            ),
            const SizedBox(height: 16),
            const Text('Last 30 days activity', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;
  _ChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;
    final values = data.map((e) => (e['total'] as int).toDouble()).toList();
    final maxVal = values.reduce((a, b) => a > b ? a : b).clamp(1.0, double.infinity);
    final minVal = values.reduce((a, b) => a < b ? a : b);

    final paint = Paint()..color = Colors.blue..strokeWidth = 2.5..style = PaintingStyle.stroke;
    final dotPaint = Paint()..color = Colors.blue;
    final gridPaint = Paint()..color = Colors.grey.withValues(alpha: 0.2)..strokeWidth = 1;

    final padLeft = 36.0, padBottom = 24.0, padTop = 12.0;
    final chartW = size.width - padLeft;
    final chartH = size.height - padBottom - padTop;

    // Grid lines
    for (var i = 0; i <= 4; i++) {
      final y = padTop + chartH * (1 - i / 4);
      canvas.drawLine(Offset(padLeft, y), Offset(size.width, y), gridPaint);
      final label = (minVal + (maxVal - minVal) * i / 4).toInt().toString();
      final tp = TextPainter(text: TextSpan(text: label, style: const TextStyle(fontSize: 10, color: Colors.grey)), textDirection: TextDirection.ltr)..layout();
      tp.paint(canvas, Offset(0, y - 6));
    }

    // Line path
    final path = Path();
    final points = <Offset>[];
    for (var i = 0; i < values.length; i++) {
      final x = padLeft + (chartW * i / (values.length - 1));
      final y = padTop + chartH * (1 - (values[i] - minVal) / (maxVal - minVal).clamp(1, double.infinity));
      points.add(Offset(x, y));
      if (i == 0) { path.moveTo(x, y); } else { path.lineTo(x, y); }
    }
    canvas.drawPath(path, paint);

    // Dots
    for (final p in points) {
      canvas.drawCircle(p, 4, dotPaint);
    }

    // Date labels (first & last)
    final first = data.first['date'].toString().substring(5);
    final last = data.last['date'].toString().substring(5);
    final tp1 = TextPainter(text: TextSpan(text: first, style: const TextStyle(fontSize: 10, color: Colors.grey)), textDirection: TextDirection.ltr)..layout();
    tp1.paint(canvas, Offset(padLeft, size.height - 16));
    final tp2 = TextPainter(text: TextSpan(text: last, style: const TextStyle(fontSize: 10, color: Colors.grey)), textDirection: TextDirection.ltr)..layout();
    tp2.paint(canvas, Offset(size.width - tp2.width, size.height - 16));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
