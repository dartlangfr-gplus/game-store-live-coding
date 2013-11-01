part of game_store.entity;

class Game {
  int id;
  String name;
  String genre;
  String image;
  String players;
  String description;
  
  String toString() => "Game{id: $id, name: $name}";
}

final Game DARTS = new Game()..id = 1
                        ..name = "Darts"
                        ..genre = "Pub Game"
                        ..description = 'Darts is a form of throwing game in which small missiles are thrown at a circular target (dartboard) fixed to a wall. Though various boards and rules have been used in the past, the term "darts" usually now refers to a standardised game involving a specific board design and set of rules.'
                        ..image = "darts.jpg";