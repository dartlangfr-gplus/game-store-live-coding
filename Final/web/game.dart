import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart';
import 'services.dart';

@CustomTag('x-game')
class XGame extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XGame.created() : super.created();

  @published Game game;
  
  String upperCase(String value) => value.toUpperCase();
  String stars(int count) => new List.generate(count, (i) => "★").join("");
  
  increaseRating(Event e, var detail, Node target) => game.rating++;
  
  delete(Event e, var detail, Element target) => gameStoreService.delete(game.id);
}