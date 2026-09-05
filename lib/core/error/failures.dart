abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'A server error occurred.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection. Please check your network.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Failed to load local cached data.']);
}

class PlatformFailure extends Failure {
  const PlatformFailure([super.message = 'Platform operation failed.']);
}
