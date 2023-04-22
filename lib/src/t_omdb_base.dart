// File imports
import './exceptions.dart';
// Library imports
import 'package:http/http.dart' as http;

enum OmdbResponseType { json, xml }
enum OmdbType { movie, series, episode }
enum OmdbPlot { short, full }

class OmdbApi {

  // Define the scheme, host and apiKey for the API to be used in the Uri
  final String scheme = 'https';
  final String host = 'omdbapi.com';
  final String apiKey;

  OmdbApi(this.apiKey);

  Future<String?> searchById(
    String id, {
    OmdbType? type,
    String? year,
    OmdbPlot? plot,
    OmdbResponseType? responseType,
  }) async {

    // Create a Map from the query parameters that aren't null
    final Map<String, dynamic> queryParameters = Map.fromEntries([
      MapEntry('i', id),
      MapEntry('apikey', apiKey),
      MapEntry('type', type?.name),
      MapEntry('y', year),
      MapEntry('plot', plot?.name),
      MapEntry('r', responseType?.name),
    ].where((element) => element.value != null));

    // Create the Uri
    final uri =
        Uri(scheme: scheme, host: host, queryParameters: queryParameters);

    // Get the response from the API and handle the status codes throwing
    // exceptions if necessary
    final response = handleOmdbHttpStatuses(await http.get(uri));

    print(response.statusCode);

    return response.body;
  }

  Future<String?> searchByTitle(
    String title, {
    OmdbType? type,
    String? year,
    OmdbPlot? plot,
    OmdbResponseType? responseType,
  }) async {

    // Create a Map from the query parameters that aren't null
    final Map<String, dynamic> queryParameters = Map.fromEntries([
      MapEntry('t', title),
      MapEntry('apikey', apiKey),
      MapEntry('type', type?.name),
      MapEntry('y', year),
      MapEntry('plot', plot?.name),
      MapEntry('r', responseType?.name),
    ].where((element) => element.value != null));

    // Create the Uri
    final uri =
        Uri(scheme: scheme, host: host, queryParameters: queryParameters);

    // Get the response from the API and handle the status codes throwing
    // exceptions if necessary
    final response = handleOmdbHttpStatuses(await http.get(uri));

    return response.body;
  }

  Future<String?> searchByQuery(
    String query, {
    OmdbType? type,
    String? year,
    OmdbResponseType? responseType,
    String? page,
  }) async {

    // Create a Map from the query parameters that aren't null
    final Map<String, dynamic> queryParameters = Map.fromEntries([
      MapEntry('s', query),
      MapEntry('apikey', apiKey),
      MapEntry('type', type?.name),
      MapEntry('y', year),
      MapEntry('r', responseType?.name),
      MapEntry('page', page),
    ].where((element) => element.value != null));

    // Create the Uri
    final uri =
    Uri(scheme: scheme, host: host, queryParameters: queryParameters);

    // Get the response from the API and handle the status codes throwing
    // exceptions if necessary
    final response = handleOmdbHttpStatuses(await http.get(uri));

    return response.body;
  }
}
