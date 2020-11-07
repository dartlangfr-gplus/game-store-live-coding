import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:game_store/models.dart';

@CustomTag('x-game')
class XGame extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XGame.created() : super.created();

  // Story 1 - Add a game attribute
  @published Game game = new Game.sample();
  
  String color;
  
  // Story 1 - Add functions to transform string to uppercase and number to stars
  String uppercase(String value) => value.toUpperCase();
  String stars(int count) => new List.generate(count, (i) => "\u2605").join();
  
  // Story 1 - Add an event handler to increase game rating
  
  // Story 7 - Add a delete button click handler and fire a custom event
  delete(Event e, detail, Element target) => 
      dispatchEvent(new CustomEvent("mydelete", detail: game));
}