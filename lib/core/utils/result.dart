import 'package:portfolio/core/error/failures.dart';

sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  T? get dataOrNull => switch (this) {
    Success(data: final d) => d,
    Error() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success() => null,
    Error(failure: final f) => f,
  };

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      Success(data: final d) => success(d),
      Error(failure: final f) => error(f),
    };
  }
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}
