import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:js_interop';
import 'package:web/web.dart' as web;
import '../data/mock_data.dart';

final _currFmt = NumberFormat('#,##0', 'en_US');

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animCtrl;
  late Animation<double> _anim;
  String _period = 'This Year';

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _anim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Analytic'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            tooltip: 'Print / Save PDF',
            onPressed: () => web.window.print(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _animCtrl.forward(from: 0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateFilter(),
            const SizedBox(height: 16),
            _buildKpiRow(),
            const SizedBox(height: 24),
            _buildRevenueChart(),
            const SizedBox(height: 24),
            _buildBottomRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateFilter() {
    return Row(
      children: [
        Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: _period,
          underline: const SizedBox(),
          style: TextStyle(fontSize: 14, color: Colors.grey.shade800, fontWeight: FontWeight.w500),
          items: const [
            DropdownMenuItem(value: 'This Month', child: Text('This Month')),
            DropdownMenuItem(value: 'This Quarter', child: Text('This Quarter')),
            DropdownMenuItem(value: 'This Year', child: Text('This Year')),
            DropdownMenuItem(value: 'Last Year', child: Text('Last Year')),
          ],
          onChanged: (v) {
            setState(() => _period = v!);
            _animCtrl.forward(from: 0);
          },
        ),
        const Spacer(),
        Text('Last updated: ${DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now())}',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
      ],
    );
  }

  Widget _buildKpiRow() {
    return AnimatedBuilder(
      animation: _anim,
      builder: (ctx, _) => LayoutBuilder(builder: (ctx, c) {
        final v = _anim.value;
        final cards = [
          _KpiCard('Total Revenue', '\$${_currFmt.format((MockData.totalRevenue * v).round())}', Icons.attach_money, Colors.green, '+${MockData.revenueGrowth}%'),
          _KpiCard('Orders', _currFmt.format((MockData.totalOrders * v).round()), Icons.shopping_cart, Colors.blue, '+${MockData.orderGrowth}%'),
          _KpiCard('Customers', _currFmt.format((MockData.totalCustomers * v).round()), Icons.people, Colors.purple, '+${MockData.customerGrowth}%'),
          _KpiCard('Conversion', '${(MockData.conversionRate * v).toStringAsFixed(1)}%', Icons.trending_up, Colors.orange, 'Avg: \$${MockData.avgOrderValue}'),
        ];
        if (c.maxWidth > 800) {
          return Row(children: cards.map((e) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: e))).toList());
        }
        return Wrap(spacing: 8, runSpacing: 8, children: cards.map((e) => SizedBox(width: (c.maxWidth - 8) / 2, child: e)).toList());
      }),
    );
  }

  Widget _buildRevenueChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Monthly Revenue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 30000),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 28, getTitlesWidget: (v, _) {
                      final i = v.toInt();
                      if (i < 0 || i >= MockData.monthlySales.length) return const SizedBox();
                      return Text(MockData.monthlySales[i].month, style: const TextStyle(fontSize: 11));
                    })),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 44, getTitlesWidget: (v, _) {
                      return Text('${(v / 1000).toInt()}k', style: const TextStyle(fontSize: 11));
                    })),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: MockData.monthlySales.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.revenue)).toList(),
                      isCurved: true,
                      color: const Color(0xFF1E3A5F),
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: true, color: const Color(0xFF1E3A5F).withOpacity(0.1)),
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 800),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomRow() {
    return LayoutBuilder(builder: (ctx, c) {
      final pie = _buildCategoryPie();
      final table = _buildProductsTable();
      if (c.maxWidth > 800) {
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(width: 300, child: pie),
          const SizedBox(width: 16),
          Expanded(child: table),
        ]);
      }
      return Column(children: [pie, const SizedBox(height: 16), table]);
    });
  }

  Widget _buildCategoryPie() {
    final colors = [Colors.blue, Colors.pink, Colors.amber, Colors.teal, Colors.grey];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sales by Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: PieChart(PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 36,
                sections: MockData.salesByCategory.asMap().entries.map((e) => PieChartSectionData(
                  value: e.value.value,
                  color: colors[e.key],
                  radius: 40,
                  title: '${e.value.value}%',
                  titleStyle: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
                )).toList(),
              )),
            ),
            const SizedBox(height: 12),
            ...MockData.salesByCategory.asMap().entries.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(children: [
                Container(width: 12, height: 12, decoration: BoxDecoration(color: colors[e.key], borderRadius: BorderRadius.circular(3))),
                const SizedBox(width: 8),
                Text(e.value.name, style: const TextStyle(fontSize: 12)),
              ]),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsTable() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Top Products', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Table(
              columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1.2), 2: FlexColumnWidth(0.8), 3: FlexColumnWidth(1)},
              children: [
                const TableRow(children: [
                  Padding(padding: EdgeInsets.only(bottom: 8), child: Text('Product', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12))),
                  Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  Text('Sold', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  Text('Revenue', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                ]),
                ...MockData.topProducts.map((p) => TableRow(children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(p.name, style: const TextStyle(fontSize: 13))),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(p.category, style: const TextStyle(fontSize: 13))),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text('${p.sold}', style: const TextStyle(fontSize: 13))),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text('\$${_currFmt.format(p.revenue)}', style: const TextStyle(fontSize: 13))),
                ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String title, value, subtitle;
  final IconData icon;
  final Color color;
  const _KpiCard(this.title, this.value, this.icon, this.color, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ]),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 12, color: color)),
        ]),
      ),
    );
  }
}
