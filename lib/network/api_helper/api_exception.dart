///[ApiException] class for defining exceptions need to be thrown as per status code.
class ApiException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  ApiException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

///[FetchDataException] -> When data or connection is lost in between.
class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

///[BadRequestException] -> When the request body is not correct.
class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

///[UnauthorisedException] -> When Unauthorized accessing.
class UnAuthorisedException extends ApiException {
  UnAuthorisedException([message]) : super(message, "Unauthorised: ");
}
