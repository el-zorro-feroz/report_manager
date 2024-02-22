import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:report_manager/src/services/gsheets_service.dart';

/// Global application services locator.
final GetIt injector = GetIt.I;

/// Initilize [injector] data.
FutureOr<void> initInjector() async {
  injector.registerLazySingleton(GSheetsService.new);
}
