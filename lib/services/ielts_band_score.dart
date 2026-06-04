class IeltsBandScore {
  /// Convert percentage score to estimated IELTS band (4.0–9.0)
  static double estimateBand(int correct, int total) {
    if (total == 0) return 0;
    final pct = correct / total;
    if (pct >= 0.95) return 9.0;
    if (pct >= 0.87) return 8.5;
    if (pct >= 0.80) return 8.0;
    if (pct >= 0.73) return 7.5;
    if (pct >= 0.67) return 7.0;
    if (pct >= 0.60) return 6.5;
    if (pct >= 0.53) return 6.0;
    if (pct >= 0.47) return 5.5;
    if (pct >= 0.40) return 5.0;
    if (pct >= 0.33) return 4.5;
    return 4.0;
  }

  /// Overall band from multiple skill bands (IELTS rounds to nearest 0.5)
  static double overallBand(List<double> bands) {
    if (bands.isEmpty) return 0;
    final avg = bands.reduce((a, b) => a + b) / bands.length;
    return (avg * 2).round() / 2.0;
  }

  static String bandLabel(double band) {
    if (band >= 8.0) return 'Expert';
    if (band >= 7.0) return 'Good';
    if (band >= 6.0) return 'Competent';
    if (band >= 5.0) return 'Modest';
    return 'Limited';
  }
}
