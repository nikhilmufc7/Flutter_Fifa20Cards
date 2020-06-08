import 'package:bloc/bloc.dart';
import 'package:fifaPlayers/bloc/player_listing_events.dart';
import 'package:fifaPlayers/bloc/player_listing_state.dart';
import 'package:fifaPlayers/models/api_models.dart';
import 'package:fifaPlayers/services/repository.dart';

import 'package:rxdart/rxdart.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);

  @override
  Stream<Transition<PlayerListingEvent, PlayerListingState>> transformEvents(
      Stream<PlayerListingEvent> events, transitionFn) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 250)),
      transitionFn,
    );
  }

  @override
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    yield PlayerFetchingState();

    try {
      List<Players> players;
      if (event is CountrySelectedEvent) {
        players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is SearchTermChangedEvent) {
        players = await playerRepository.fetchPlayersByName(event.searchTerm);
      } else if (event is AdvancedSearchChangedEvent) {
        players = await playerRepository
            .fetchPlayersBySearchConfiguration(event.searchConfiguration);
      }

      if (players.length == 0) {
        yield PlayerEmptyState();
      } else {
        yield PlayersFetchedState(players: players);
      }
    } catch (_) {
      PlayersErrorState();
    }
  }
}
