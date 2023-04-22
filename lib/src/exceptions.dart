import 'package:http/http.dart';

class OmdbApiException implements Exception {

  final int statusCode;
  final String message;

  OmdbApiException(this.statusCode, this.message);

  @override
  String toString() => 'statusCode: $statusCode, $runtimeType: $message';
}

/// Should be thrown as result of 400 status code
class OmdbApiBadRequestException extends OmdbApiException {
  OmdbApiBadRequestException(super.statusCode, super.message);
}

/// Should be thrown as result of 401 status code
class OmdbApiUnauthorizedException extends OmdbApiException {
  OmdbApiUnauthorizedException(super.statusCode, super.message);
}

/// Should be thrown as result of 403 status code
class OmdbApiForbiddenException extends OmdbApiException {
  OmdbApiForbiddenException(super.statusCode, super.message);
}

/// Should be thrown as result of 404 status code
class OmdbApiNotFoundException extends OmdbApiException {
  OmdbApiNotFoundException(super.statusCode, super.message);
}

/// Should be thrown as result of 500 status code
class OmdbApiInternalServerErrorException extends OmdbApiException {
  OmdbApiInternalServerErrorException(super.statusCode, super.message);
}

/// Should be thrown as result of 502 status code
class OmdbApiBadGatewayException extends OmdbApiException {
  OmdbApiBadGatewayException(super.statusCode, super.message);
}

/// Should be thrown as result of 503 status code
class OmdbApiServiceUnavailableException extends OmdbApiException {
  OmdbApiServiceUnavailableException(super.statusCode, super.message);
}

/// Should be thrown as result of 504 status code
class OmdbApiGatewayTimeoutException extends OmdbApiException {
  OmdbApiGatewayTimeoutException(super.statusCode, super.message);
}

/// Used to handle the http status codes returned by the omdb api
///
/// Example:
///
/// ```
/// final response = handleOmdbHttpStatuses(await http.get(uri));
/// ```
Response handleOmdbHttpStatuses(Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 400:
      throw OmdbApiBadRequestException(response.statusCode, response.body);
    case 401:
      throw OmdbApiUnauthorizedException(response.statusCode, response.body);
    case 403:
      throw OmdbApiForbiddenException(response.statusCode, response.body);
    case 404:
      throw OmdbApiNotFoundException(response.statusCode, response.body);
    case 500:
      throw OmdbApiInternalServerErrorException(response.statusCode, response.body);
    case 502:
      throw OmdbApiBadGatewayException(response.statusCode, response.body);
    case 503:
      throw OmdbApiServiceUnavailableException(response.statusCode, response.body);
    case 504:
      throw OmdbApiGatewayTimeoutException(response.statusCode, response.body);
    default:
      throw OmdbApiException(response.statusCode, response.body);
  }
}