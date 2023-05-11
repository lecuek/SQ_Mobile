import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/game_list_service.dart';
import '../services/service_locator.dart';
import 'game_card.dart';
class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  // final GameListService gameListService = GameListService();
  final gameListService = getIt<GameListService>();
  var gameList;

  @override
  Future<void> initState() async {
    gameList = await gameListService.fetchGameList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var game in gameList)
          GameCard(game)
      ],
    );
  }
}
