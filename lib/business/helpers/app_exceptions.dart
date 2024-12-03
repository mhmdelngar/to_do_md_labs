class AppExceiption implements Exception {
  final String? message, prefix, url;

  AppExceiption({
    this.message,
    this.prefix,
    this.url,
  });
}

class BadRequestException extends AppExceiption {
  BadRequestException({
    required String message,
    required String url,
  }) : super(message: message, prefix: "Bad request", url: url);
}

class FetchDataException extends AppExceiption {
  FetchDataException({
    required String message,
    required String url,
  }) : super(message: message, prefix: "Unable to process request", url: url);
}

class ApiNotRespondingException extends AppExceiption {
  ApiNotRespondingException({
    required String message,
    required String url,
  }) : super(message: message, prefix: "API didn't respond", url: url);
}

class InvalidAuthException extends AppExceiption {
  InvalidAuthException({
    required String message,
    required String url,
  }) : super(message: message, prefix: "Invalid Auth", url: url);
}

class NotFoundException extends AppExceiption {
  NotFoundException({
    required String message,
    required String url,
  }) : super(message: message, prefix: "Not found", url: url);
}
