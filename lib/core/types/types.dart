import 'package:dartz/dartz.dart';
import 'package:report_manager/core/failure/failure.dart';

/// Represent either [Failure] or generated [T] value.
typedef FailOr<T> = Either<Failure, T>;

/// Represent either [Failure] or [Unit] value.
typedef FailOrUnit = Either<Failure, Unit>;
