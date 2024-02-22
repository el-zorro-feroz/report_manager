import 'dart:async';

import 'package:flutter/material.dart';
import 'package:report_manager/src/data/report_entry.dart';
import 'package:report_manager/src/presentation/dialogs/new_report_dialog.dart';
import 'package:report_manager/src/presentation/widgets/control_panel_widget.dart';
import 'package:report_manager/src/presentation/widgets/report_entry_widget.dart';
import 'package:report_manager/src/presentation/widgets/table_description_widget.dart';

/// Reporting display page for spec time period and dashboard.
/// Displayed after the database has been accessed, otherwise, an error screen.
class HomePage extends StatelessWidget {
  /// Returns an instance of [HomePage].
  const HomePage({super.key});

  ///
  void openNewReportDialog(BuildContext context) {
    unawaited(showGeneralDialog(context: context, pageBuilder: (_, __, ___) => const NewReportDialog()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ControlPanelWidget(
                onNewReportPressed: () {
                  openNewReportDialog(context);
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: TableDescriptionWidget(),
            ),
            SliverList.builder(
              itemCount: 40,
              itemBuilder: (_, __) {
                final reportEntry = ReportEntry(
                  date: DateTime.now(),
                  publisher: 'Савин',
                  special: 0,
                  v_ante: 2323.2,
                  v_post: 2424.2,
                  refuel: 100,
                  spent: 14.2,
                  result: 84.2,
                );

                return ReportEntryWidget(
                  entry: reportEntry,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
