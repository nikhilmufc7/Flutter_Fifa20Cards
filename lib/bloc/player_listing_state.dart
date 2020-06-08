import 'package:fifaPlayers/models/api_models.dart';
import 'package:flutter/foundation.dart';

abstract class PlayerListingState {}

class PlayerUninitializedState extends PlayerListingState {}

class PlayerFetchingState extends PlayerListingState {}

class PlayersFetchedState extends PlayerListingState {
  final List<Players> players;
  PlayersFetchedState({@required this.players}) : assert(players != null);
}

class PlayersErrorState extends PlayerListingState {}

class PlayerEmptyState extends PlayerListingState {}
