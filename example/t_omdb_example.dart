import 'package:t_omdb/t_omdb.dart';

void main() async {
  final omdb = OmdbApi('your-api-key');

  // Search for "guardians of the galaxy" by it's imdb id
  final String? byId = await omdb.searchById('tt3896198');

  // Search specifically for "guardians of the galaxy" by title (returns the first result)
  final String? byTitle = await omdb.searchByTitle('guardians of the galaxy');

  // Search for "guardians of the galaxy" by query (returns multiple results that match the query)
  final String? byQuery = await omdb.searchByQuery('guardians of the galaxy', type: OmdbType.movie, year: '2017', responseType: OmdbResponseType.json);

  print(byId);
  print(byTitle);
  print(byQuery);
}
