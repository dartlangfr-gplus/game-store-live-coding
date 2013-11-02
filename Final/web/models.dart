library game_store.models;

import 'package:polymer/polymer.dart';

class Game extends Object with Observable {
  @observable String name;
  @observable String genre;
  @observable String description;
  @observable String image;
  @observable int note;
  
  String toString() => "Game{name: $name}";
}

final List<Game> games = [
  new Game()..name = "Darts"..genre = "Pub game"..description = 'Darts is ...'..image = "darts.jpg"..note = 5,                    
  new Game()..name = "Chess"..genre = "Board game"..description = 'Chess is ...'..image = "chess.jpg"..note = 4,                    
  new Game()..name = "Dices"..genre = "Random game"..description = 'Dice are ...'..image = "dice.jpg"..note = 3,                    
  new Game()..name = "Go"..genre = "Board game"..description = 'Go is ...'..image = "go.jpg"..note = 2,                    
];