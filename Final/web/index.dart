import 'dart:html';

void main() {
  //  Query "Game"
  var game = querySelector("#game");
  
  // Populate content
  game.querySelector("#image").src = "img/games/darts.jpg";
  game.querySelector("#title").text = "Darts".toUpperCase();
  game.querySelector("#genre").text = "Pub games";
  game.querySelector("#description").text = "Darts description";
  var note = game.querySelector("#note");
  note..text = "★★"
    ..onClick.capture((e) => note.text += "★");
}
