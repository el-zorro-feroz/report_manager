/// TODO(docs): Write Documentation
class ReportEntry {
  /// Returns an instance of [ReportEntry]
  const ReportEntry({
    required this.date,
    required this.publisher,
    required this.special,
    required this.v_ante,
    required this.v_post,
    required this.refuel,
    required this.spent,
    required this.result,
  });

  final DateTime date;
  final String publisher;
  final int special;
  final double v_ante;
  final double v_post;
  final double refuel;
  final double spent;
  final double result;
}
