import 'package:fifaPlayers/bloc/player_listing_bloc.dart';
import 'package:fifaPlayers/bloc/player_listing_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      child: TextField(
        onChanged: (term) {
          BlocProvider.of<PlayerListingBloc>(context)
              .add(SearchTermChangedEvent(searchTerm: term));
          print(term);
        },
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for a player',
            hintStyle: TextStyle(color: Colors.black, fontSize: 16),
            prefixIcon: Icon(Icons.search, color: Colors.black, size: 30)),
      ),
    );
  }
}
