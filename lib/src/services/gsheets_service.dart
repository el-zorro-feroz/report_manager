import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gsheets/gsheets.dart';
import 'package:report_manager/core/api/google_api.dart';
import 'package:report_manager/core/failure/failure.dart';

part 'gsheets_service.freezed.dart';

/// Freezed [GSheetsService] states.
@freezed
class GSheetsServiceState with _$GSheetsServiceState {
  /// Represent [GSheetsService] initialization state.
  const factory GSheetsServiceState.init() = InitGSheetsServiceState;

  /// Represent [GSheetsService] state with loaded data from Google Sheets.
  const factory GSheetsServiceState.loaded({
    required GSheets gSheets,
    required Spreadsheet spreadsheet,
  }) = LoadedGSheetsServiceState;

  /// Represent [GSheetsService] state with failures.
  const factory GSheetsServiceState.error({
    required Failure failure,
  }) = ErrorGSheetsServiceState;
}

/// [GSheetsService] Initialization [Failure].
class GSheetsInitFailure extends Failure {
  /// Returns an instance of [GSheetsInitFailure].
  const GSheetsInitFailure({
    required super.stackTrace,
    super.message = 'Google Sheets Initialization Failure',
  });
}

/// GSheets connection service.
class GSheetsService extends ChangeNotifier {
  /// [GSheetsService] State.
  GSheetsServiceState state = const GSheetsServiceState.init();

  /// Reconnect to GSheets Service with saved API Keys.
  FutureOr<void> connect() async {
    try {
      await state.whenOrNull(
        init: () async {
          final gSheets = GSheets(gSheetsAccountCredentials);
          final spreadsheet = await gSheets.spreadsheet(gSheetsSSID);

          state = GSheetsServiceState.loaded(
            gSheets: gSheets,
            spreadsheet: spreadsheet,
          );

          notifyListeners();
        },
      );
    } catch (_, __) {
      state = GSheetsServiceState.error(
        failure: GSheetsInitFailure(stackTrace: __),
      );
    }
  }

  /// Attempt to disconnect from GSheets Service.
  FutureOr<void> disconnect() async {
    try {
      await state.whenOrNull(
        loaded: (gSheets, spreadsheet) async {
          await gSheets.close();

          state = const GSheetsServiceState.init();
          notifyListeners();
        },
      );
    } catch (_, __) {
      state = GSheetsServiceState.error(
        failure: GSheetsInitFailure(stackTrace: __),
      );
    }
  }
}
