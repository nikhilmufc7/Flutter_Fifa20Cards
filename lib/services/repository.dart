import 'package:fifaPlayers/models/api_models.dart';
import 'package:fifaPlayers/search_configuration.dart';
import 'package:fifaPlayers/services/api_provider.dart';

class PlayerRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryID) =>
      _apiProvider.fetchPlayersByCountry(countryID);

  Future<List<Players>> fetchPlayersByName(String searchTerm) =>
      _apiProvider.fetchPlayersByName(searchTerm);

  Future<List<Players>> fetchPlayersBySearchConfiguration(
          SearchConfiguration searchConfiguration) =>
      _apiProvider.fetchPlayersBySearchConfiguration(searchConfiguration);
}
