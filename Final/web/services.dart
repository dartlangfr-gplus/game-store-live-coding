library game_store.service;

import 'dart:math';
import 'models.dart';

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
  
  List<Game> getAll() => games.values.toList();
  Game getById(int id) => games[id];
  Game save(Game game) {
    if(game.id == null) {
      game.id = games.values.map((g) => g.id).fold(0, max);
    }
    games[game.id] = game;
    return game;
  }
}

final GameStoreService gameStoreService = new GameStoreService();