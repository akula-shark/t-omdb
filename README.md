# Unofficial Dart library for interacting with OMDb API
For questions or help ask <a href="https://github.com/akula-shark/t-omdb/discussions/categories/q-a">here</a>. File issues <a href="https://github.com/akula-shark/t-omdb/issues">here</a> and see pub.dev page <a href="https://pub.dev/packages/t_omdb">here</a>.

## Todo list
- [x] Search by ID
- [x] Search by title
- [x] Search by query
- [ ] Posters API
- [ ] Tests

## Getting started

### Add dependency
```
$ dart pub add t_omdb
```
or add it manually to your `pubspec.yaml` file:
```yaml
dependencies:
  t_omdb: ^replace-with-latest-version
```
### Example usage:
```dart
import 'package:t_omdb/t_omdb.dart';

void main() async {
  final omdb = OmdbApi('your-api-key');

  // Search for "guardians of the galaxy" by it's imdb id
  final String? byId = await omdb.searchById('tt3896198');

  // Search specifically for "guardians of the galaxy" by title (returns the first result)
  final String? byTitle = await omdb.searchByTitle('guardians of the galaxy');

  // Search for "guardians of the galaxy" by query (returns multiple results that match the query)
  final byQuery = await omdb.searchByQuery('guardians of the galaxy', type: OmdbType.movie, year: '2017', responseType: OmdbResponseType.json);

  print(byId);
  print(byTitle);
  print(byQuery);
}
```
## Parameters

### By ID or Title
*Please note either i or t is required*

| Parameter | Required | Valid options          | Description |
| --------- | -------- |------------------------| ----------- |
| i         | Optional*| <empty>                | A valid IMDb ID (e.g. tt1285016) |
| t         | Optional*| <empty>                | Movie title to search for. |
| type      | No       | movie, series, episode | Type of result to return. |
| y         | No       | <empty>                | Year of release. |
| plot      | No       | short, full            | Return short or full plot. |
| r         | No       | json, xml              | The data type to return. |

### By Search

| Parameter | Required | Valid options        | Default Value | Description |
| --------- |----------|----------------------| ------------- | ----------- |
| s         | Yes      | <empty>              |               | Movie title to search for. |
| type      | No       | movie, series, episode |      | Type of result to return. |
| y         | No       | <empty>              |              | Year of release. |
| r         | No       | json, xml            | json         | The data type to return. |
| page      | No       | 1 - 100              | 1            | Page number to return. |
