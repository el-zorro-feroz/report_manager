import 'package:flutter/material.dart';

/// Returns an instance of [NewReportDialog]
class NewReportDialog extends StatelessWidget {
  /// Returns an instance of [NewReportDialog]
  const NewReportDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'TEST DIALOG',
          ),
        ),
      ),
    );
  }
}
