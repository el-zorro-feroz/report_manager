import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:report_manager/core/api/google_api.dart';
import 'package:report_manager/core/injector/injector.dart';
import 'package:report_manager/src/presentation/app.dart';
import 'package:report_manager/src/services/gsheets_service.dart';

/// HARD_CODED_NUMBER
const fuelPerHour = 6.9;

Future<void> test() async {
  final gSheets = GSheets(gSheetsAccountCredentials);
  final ss = await gSheets.spreadsheet(gSheetsSSID);
  final ws = ss.worksheetByTitle('report');
  if (ws == null) return;

  final date = '02.02.2024';
  final publisher = 2;
  final special = 2;
  final vAnte = '=\$E${ws.rowCount}';
  final vPost = 1111.1;
  final refuel = 0;
  final spent = 10.1;
  final result = '=\$H${ws.rowCount}-\$G${ws.rowCount + 1}+\$F${ws.rowCount + 1}';

  await ws.values.insertRow(
    ws.rowCount + 1,
    [date, publisher, special, vAnte, vPost, refuel, spent, result],
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjector();
  await injector<GSheetsService>().connect();

  runApp(const App());
}
