library game_store.server.game_api;

import 'dart:async';
import 'dart:math';
import '../lib/models.dart';

class GameStoreService {
  final Map<int, Game> games = new Map.fromIterable([
    new Game()..id = 1..name = "Darts"..genre = "Pub game"..description = 'Darts is ...'..image = "darts.jpg"..rating = 5,                    
    new Game()..id = 2..name = "Chess"..genre = "Board game"..description = 'Chess is ...'..image = "chess.jpg"..rating = 4,                    
    new Game()..id = 3..name = "Dices"..genre = "Random game"..description = 'Dice are ...'..image = "dice.jpg"..rating = 3,                    
    new Game()..id = 4..name = "Go"..genre = "Board game"..description = 'Go is ...'..image = "go.jpg"..rating = 2,
    new Game()..id = 5..name = "Poker"..genre = "Card game"..description = 'Poker is ..'..image="poker.jpg"..rating = 4,
    new Game()..id = 6..name = "Pool"..genre = "Pub game"..description = 'Pool is ..'..image="pool.jpg"..rating = 3,
    new Game()..id = 7..name = "Bingo"..genre = "Boring game"..description = 'Bingo is ..'..image="bingo.jpg"..rating = 1
  ], key: (g) => g.id);
  
  Future<List<Game>> getAll() => new Future.value(games.values.toList());
  Future<Game> getById(int id) => new Future.value(games[id]);
  Future<Game> save(Game game) => new Future(() {
    if(game.id == null) {
      game.id = games.values.map((g) => g.id).fold(0, max) + 1;
    }
    games[game.id] = game;
    return game;
  });
  Future<Game> delete(int gameId) => new Future.value(games.remove(gameId));
}

final GameStoreService gameStoreService = new GameStoreService();
