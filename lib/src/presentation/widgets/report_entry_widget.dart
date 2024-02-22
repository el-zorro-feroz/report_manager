import 'package:flutter/material.dart';
import 'package:report_manager/src/data/report_entry.dart';

/// TODO(docs): Write Documentation
class ReportEntryWidget extends StatelessWidget {
  /// Returns an instance of [ReportEntryWidget]
  const ReportEntryWidget({
    required this.entry,
    super.key,
  });

  final ReportEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(child: Text(entry.date.toString().split(' ').first)),
          Expanded(child: Text(entry.publisher)),
          Expanded(child: Text(entry.special.toString())),
          Expanded(child: Text(entry.v_ante.toString())),
          Expanded(child: Text(entry.v_post.toString())),
          Expanded(child: Text(entry.refuel.toString())),
          Expanded(child: Text(entry.spent.toString())),
          Expanded(child: Text(entry.result.toString())),
        ],
      ),
    );
  }
}
