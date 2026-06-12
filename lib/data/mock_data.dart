class SalesData {
  final String month;
  final double revenue;
  final int orders;
  SalesData(this.month, this.revenue, this.orders);
}

class CategoryData {
  final String name;
  final double value;
  CategoryData(this.name, this.value);
}

class TopProduct {
  final String name;
  final String category;
  final int sold;
  final double revenue;
  TopProduct(this.name, this.category, this.sold, this.revenue);
}

class MockData {
  static const double totalRevenue = 1248500;
  static const int totalOrders = 3842;
  static const double conversionRate = 3.7;
  static const int totalCustomers = 1205;
  static const double avgOrderValue = 324.9;
  static const double revenueGrowth = 12.5;
  static const double orderGrowth = 8.3;
  static const double customerGrowth = 15.2;

  static final List<SalesData> monthlySales = [
    SalesData('Jan', 85000, 260),
    SalesData('Feb', 92000, 285),
    SalesData('Mar', 78000, 240),
    SalesData('Apr', 105000, 320),
    SalesData('May', 115000, 355),
    SalesData('Jun', 98000, 310),
    SalesData('Jul', 125000, 380),
    SalesData('Aug', 110000, 345),
    SalesData('Sep', 132000, 405),
    SalesData('Oct', 118000, 365),
    SalesData('Nov', 142000, 430),
    SalesData('Dec', 148500, 447),
  ];

  static final List<CategoryData> salesByCategory = [
    CategoryData('Electronics', 35.2),
    CategoryData('Fashion', 24.8),
    CategoryData('Home & Garden', 18.5),
    CategoryData('Sports', 12.3),
    CategoryData('Others', 9.2),
  ];

  static final List<TopProduct> topProducts = [
    TopProduct('Wireless Headphones', 'Electronics', 842, 126300),
    TopProduct('Smart Watch Pro', 'Electronics', 654, 196200),
    TopProduct('Running Shoes X1', 'Sports', 523, 78450),
    TopProduct('Cotton T-Shirt Pack', 'Fashion', 1205, 60250),
    TopProduct('LED Desk Lamp', 'Home & Garden', 412, 32960),
  ];
}
