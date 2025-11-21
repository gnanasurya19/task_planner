class AppException implements Exception {
  final String message;
  final int? statusCode;
  final String? identifier;
  const AppException(this.statusCode, this.identifier, this.message);

  @override
  String toString() => "$message ";
}

class BadRequestException extends AppException {
  const BadRequestException(
    super.statusCode,
    super.identifier, [
    super.message = "Bad request Contact Admin",
  ]);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(
    super.statusCode,
    super.identifier, [
    super.message = "Unauthorized Request",
  ]);
}

class NotFoundException extends AppException {
  const NotFoundException(
    super.statusCode,
    super.identifier, [
    super.message = "Not Found",
  ]);
}

class InternalServerErrorException extends AppException {
  const InternalServerErrorException(
    super.statusCode,
    super.identifier, [
    super.message = "Internal Server Error",
  ]);
}

class NoInternetException extends AppException {
  const NoInternetException(
    super.statusCode,
    super.identifier, [
    super.message = "No internet connection",
  ]);
}

class UnknownApiException extends AppException {
  const UnknownApiException(
    super.statusCode,
    super.identifier, [
    super.message = "Unknown API error",
  ]);
}
