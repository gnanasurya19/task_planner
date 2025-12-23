class AppException implements Exception {
  final String message;
  final int? statusCode;
  const AppException(this.statusCode, this.message);

  @override
  String toString() => "$message ";
}

class BadRequestException extends AppException {
  const BadRequestException(super.statusCode, super.message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.statusCode, super.message);
}

class NotFoundException extends AppException {
  const NotFoundException(super.statusCode, super.message);
}

class InternalServerErrorException extends AppException {
  const InternalServerErrorException(super.statusCode, super.message);
}

class NoInternetException extends AppException {
  const NoInternetException(super.statusCode, super.message);
}

class UnknownApiException extends AppException {
  const UnknownApiException(super.statusCode, super.message);
}
