import 'package:fifaPlayers/models/nations.dart';
import 'package:fifaPlayers/search_configuration.dart';
import 'package:meta/meta.dart';

abstract class PlayerListingEvent {}

class CountrySelectedEvent extends PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectedEvent({@required this.nationModel})
      : assert(nationModel != null);
}

class SearchTermChangedEvent extends PlayerListingEvent {
  final String searchTerm;

  SearchTermChangedEvent({this.searchTerm}) : assert(searchTerm != null);
}

class AdvancedSearchChangedEvent extends PlayerListingEvent {
  final SearchConfiguration searchConfiguration;

  AdvancedSearchChangedEvent({@required this.searchConfiguration})
      : assert(searchConfiguration != null);
}
