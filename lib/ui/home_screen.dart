import 'package:fifaPlayers/bloc/player_listing_bloc.dart';
import 'package:fifaPlayers/bloc/player_listing_events.dart';
import 'package:fifaPlayers/search_configuration.dart';
import 'package:fifaPlayers/services/repository.dart';
import 'package:fifaPlayers/themes.dart';
import 'package:fifaPlayers/ui/advanced_search_screen.dart';
import 'package:fifaPlayers/ui/player_listing.dart';
import 'package:fifaPlayers/widgets/horizontal_bar.dart';
import 'package:fifaPlayers/widgets/message.dart';
import 'package:fifaPlayers/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final PlayerRepository playerRepository;

  HomeScreen({
    Key key,
    this.playerRepository,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlayerListingBloc _playerListingBloc;
  SearchConfiguration _searchConfiguration = SearchConfiguration();

  @override
  void initState() {
    super.initState();
    _playerListingBloc =
        PlayerListingBloc(playerRepository: widget.playerRepository);
  }

  @override
  void dispose() {
    super.dispose();
    _playerListingBloc.close();
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _playerListingBloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            label: Text('Advanced Search'),
            icon: Icon(Icons.filter_list),
            onPressed: () async {
              final resultMap = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdvancedSearchScreen(
                            searchConfiguration: _searchConfiguration,
                          )));

              if (resultMap == null) {
                return Message(
                  message: 'Select a filter to continue ',
                );
              }

              _searchConfiguration = resultMap["search_configuration"];

              _playerListingBloc.add(AdvancedSearchChangedEvent(
                  searchConfiguration: _searchConfiguration));
            }),
        appBar: AppBar(
          title: Text(
            'Fifa 20 Player Ratings',
            style: appBarTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              HorizontalBar(),
              SizedBox(height: 10.0),
              SearchBar(),
              PlayerListing()
            ],
          ),
        ),
      ),
    );
  }
}
