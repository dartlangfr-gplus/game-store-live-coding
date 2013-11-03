library game_store.model;

import 'package:polymer/polymer.dart';

class Game extends Object with Observable {
  @observable int id;
  @observable String name;
  @observable String genre;
  @observable String description;
  @observable String image;
  @observable int rating;
  
  bool contains(String search) {
    var pattern = new RegExp(search, caseSensitive: false);
    return name.contains(pattern) || genre.contains(pattern) || description.contains(pattern);
  }
  
  String toString() => "Game{id: $id, name: $name}";

  static final Map _comparators = {
    "name": (Game a, Game b) => a.name.compareTo(b.name),                                       
    "rating": (Game a, Game b) => a.rating.compareTo(b.rating)                                       
  };
  static getComparator(String field) => _comparators.containsKey(field) ? _comparators[field] : (a, b) => 0;
}

