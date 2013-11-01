import 'dart:html';

// Retrieve DOM elements
var game = querySelector("#game");
var image = game.querySelector("#image");
var title = game.querySelector("#title");
var genre = game.querySelector("#genre");
var description = game.querySelector("#description");
var note = game.querySelector("#note");

void main() {
  // Populate content
  title.text = "Darts".toUpperCase();
  genre.text = "Pub games";
  description.text = "Darts description";
  image.src = "img/games/darts.jpg";
  note..text = "★★"
    ..onClick.capture(increaseNote);
}

increaseNote(e) => note.text += "★";
