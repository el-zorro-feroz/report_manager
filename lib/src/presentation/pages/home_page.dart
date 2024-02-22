import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:report_manager/core/failure/failure.dart';
import 'package:report_manager/core/injector/injector.dart';
import 'package:report_manager/src/data/report_entry.dart';
import 'package:report_manager/src/presentation/dialogs/new_report_dialog.dart';
import 'package:report_manager/src/presentation/widgets/control_panel_widget.dart';
import 'package:report_manager/src/presentation/widgets/report_entry_widget.dart';
import 'package:report_manager/src/presentation/widgets/table_description_widget.dart';
import 'package:report_manager/src/services/gsheets_service.dart';

/// Reporting display page for spec time period and dashboard.
/// Displayed after the database has been accessed, otherwise, an error screen.
class HomePage extends StatelessWidget {
  /// Returns an instance of [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gsService = injector<GSheetsService>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: ListenableBuilder(
          listenable: gsService,
          builder: (_, __) {
            return gsService.state.when(
              init: _InitHomePage.new,
              loaded: _LoadedHomePage.new,
              error: _ErrorHomePage.new,
            );
          },
        ),
      ),
    );
  }
}

class _InitHomePage extends StatelessWidget {
  const _InitHomePage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }
}

class _LoadedHomePage extends StatelessWidget {
  const _LoadedHomePage(this.sheets, this.spreadsheet);

  final GSheets sheets;
  final Spreadsheet spreadsheet;

  Future<List<List<String>>> getData(Worksheet worksheet) async {
    return worksheet.values.allRows(fromRow: 2);
  }

  void _openNewReportDialog(BuildContext context) {
    unawaited(
      showGeneralDialog(
        context: context,
        pageBuilder: (_, __, ___) => const NewReportDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final worksheet = spreadsheet.worksheetByTitle('report');

    if (worksheet == null) {
      return const Center(
        child: Text('Документ не найден'),
      );
    }

    return FutureBuilder(
      future: getData(worksheet),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 1,
            ),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Невозможно получить данные с сервера',
            ),
          );
        }

        final data = snapshot.data!;

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ControlPanelWidget(
                onNewReportPressed: () {
                  _openNewReportDialog(context);
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: TableDescriptionWidget(),
            ),
            SliverList.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                print(data.elementAt(index).elementAt(1));
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
        );
      },
    );
  }
}

class _ErrorHomePage extends StatelessWidget {
  const _ErrorHomePage(this.failure);

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }
}
