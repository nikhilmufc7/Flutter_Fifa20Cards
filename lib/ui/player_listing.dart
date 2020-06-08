import 'package:fifaPlayers/bloc/player_listing_bloc.dart';
import 'package:fifaPlayers/bloc/player_listing_state.dart';
import 'package:fifaPlayers/models/api_models.dart';
import 'package:fifaPlayers/themes.dart';
import 'package:fifaPlayers/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<PlayerListingBloc>(context),
      builder: (BuildContext context, state) {
        if (state is PlayerUninitializedState) {
          return Message(message: 'Please select a country to fetch players');
        } else if (state is PlayerEmptyState) {
          return Message(message: 'No players found for the country');
        } else if (state is PlayersErrorState) {
          return Message(
            message: 'Some error occurred',
          );
        } else if (state is PlayerFetchingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          final stateAsFetchedState = state as PlayersFetchedState;
          final players = stateAsFetchedState.players;
          return buildPlayers(players);
        }
      },
    );
  }

  Widget buildPlayers(List<Players> players) {
    return GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(
        players.length,
        (index) {
          Players player = players[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  'assets/imgs/fifa.png',
                ))),
              ),
              Positioned(
                left: 75,
                right: 40,
                top: 20,
                bottom: 100,
                child: Image.network(
                  player.headshot.imgUrl,
                  width: 70.0,
                  height: 70.0,
                ),
              ),
              Positioned(
                  left: 60,
                  right: 0,
                  top: 20,
                  bottom: 80,
                  child: Text(
                    player.rating.toString(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Positioned(
                  left: 35,
                  right: 100,
                  top: 35,
                  bottom: 80,
                  child: Text(
                    player.position,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )),
              Positioned(
                  left: 35,
                  right: 100,
                  top: 0,
                  bottom: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  )),
              Positioned(
                  left: 55,
                  right: 120,
                  top: 30,
                  bottom: 100,
                  child: Image.network(
                    player.nation.imageUrls.small,
                    height: 20,
                    width: 20,
                  )),
              Positioned(
                  left: 35,
                  right: 100,
                  top: 60,
                  bottom: 110,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  )),
              Positioned(
                  left: 55,
                  right: 120,
                  top: 80,
                  bottom: 100,
                  child: Image.network(
                    player.club.imageUrls.dark.small,
                    height: 20,
                    width: 20,
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 110,
                  bottom: 60,
                  child: Text(
                    player.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )),
              Positioned(
                  left: 30,
                  right: 30,
                  top: 110,
                  bottom: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black54,
                    ),
                  )),
              Positioned(
                  left: 55,
                  right: 30,
                  top: 130,
                  bottom: 55,
                  child: Row(
                    children: [
                      Text(
                        player.acceleration.toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' PAC',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
              Positioned(
                  left: 55,
                  right: 30,
                  top: 150,
                  bottom: 40,
                  child: Row(
                    children: [
                      Text(
                        player.finishing.toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' SHO',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
              Positioned(
                  left: 55,
                  right: 30,
                  top: 170,
                  bottom: 25,
                  child: Row(
                    children: [
                      Text(
                        player.shortpassing.toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' PAS',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
              Positioned(
                  left: 70,
                  right: 70,
                  top: 135,
                  bottom: 25,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: VerticalDivider(
                      thickness: 0.5,
                      color: Colors.black54,
                    ),
                  )),
              Positioned(
                  left: 110,
                  right: 0,
                  top: 130,
                  bottom: 55,
                  child: Row(
                    children: [
                      Text(
                        player.dribbling.toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' PAC',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
              Positioned(
                  left: 110,
                  right: 0,
                  top: 150,
                  bottom: 40,
                  child: Row(
                    children: [
                      Text(
                        player.standingtackle.toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' DEF',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
              Positioned(
                  left: 110,
                  right: 0,
                  top: 170,
                  bottom: 25,
                  child: Row(
                    children: [
                      Text(
                        player.strength.toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' PHY',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
