import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart';

@CustomTag('x-game')
class XGame extends PolymerElement {
  @published Game game;
  
  XGame.created() : super.created();

  bool get applyAuthorStyles => true;
  
  String upperCase(String value) => value.toUpperCase();
  String stars(int count) => new List.generate(count, (i) => "★").join("");
  
  increaseRating(Event e, var detail, Node target) => game.rating++;
}