import 'package:http/http.dart';

class OmdbApiException implements Exception {

  final int statusCode;
  final String message;

  OmdbApiException(this.statusCode, this.message);

  @override
  String toString() => 'statusCode: $statusCode, $runtimeType: $message';
}

class OmdbApiNotFoundException extends OmdbApiException {
  OmdbApiNotFoundException(super.statusCode, super.message);
}

class OmdbApiBadRequestException extends OmdbApiException {
  OmdbApiBadRequestException(super.statusCode, super.message);
}

class OmdbApiUnauthorizedException extends OmdbApiException {
  OmdbApiUnauthorizedException(super.statusCode, super.message);
}

class OmdbApiForbiddenException extends OmdbApiException {
  OmdbApiForbiddenException(super.statusCode, super.message);
}

class OmdbApiInternalServerErrorException extends OmdbApiException {
  OmdbApiInternalServerErrorException(super.statusCode, super.message);
}

class OmdbApiBadGatewayException extends OmdbApiException {
  OmdbApiBadGatewayException(super.statusCode, super.message);
}

class OmdbApiServiceUnavailableException extends OmdbApiException {
  OmdbApiServiceUnavailableException(super.statusCode, super.message);
}

class OmdbApiGatewayTimeoutException extends OmdbApiException {
  OmdbApiGatewayTimeoutException(super.statusCode, super.message);
}

dynamic handleOmdbHttpStatuses(Response response) {
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