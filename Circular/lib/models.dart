library game_store.model;

import 'package:observe/observe.dart';

class Game extends Object with Observable {
  @observable int id;
  @observable String name = "Game name";
  @observable String genre = "Game genre";
  @observable String description = "Game description";
  @observable String image = "darts.jpg";
  @observable int rating = 1;
   
  // Used for DEBUGGING
  String toString() => "Game{id: $id, name: $name}";

  // Used for FILTERING
  bool contains(String search) {
    var pattern = new RegExp(search, caseSensitive: false);
    return name.contains(pattern) || genre.contains(pattern) || description.contains(pattern);
  }
  
  // Used for SORTING
  static getComparator(String field) => _comparators.containsKey(field) ? _comparators[field] : (a, b) => 0;
  static final Map _comparators = {
    "name": (Game a, Game b) => a.name.compareTo(b.name),                                       
    "rating": (Game a, Game b) => a.rating.compareTo(b.rating)                                       
  };
  
  // Used for SERIALIZATION
  static fromMap(Map values) => new Game()
    ..id = values['id']
    ..name = values['name']
    ..genre = values['genre']
    ..description = values['description']
    ..image = values['image']
    ..rating = values['rating'];
  Map toMap() => {
    'id': id,
    'name': name,
    'genre': genre,
    'description': description,
    'image': image,
    'rating': rating,
  };
}

