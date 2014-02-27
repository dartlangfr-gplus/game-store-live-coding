import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:game_store/models.dart';
import 'services.dart';
import 'utils.dart';

@CustomTag('x-game-edit')
class XGameEdit extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XGameEdit.created() : super.created() {
    // Story 5 - Load the game when gameId attribute change
  }

  @published int gameId = null;
  @observable Game game = new Game.sample();
  
  loadGame() => gameId == null ? 
        game = new Game.sample() 
      : gameStoreService.getById(gameId).then((result) => game = result);
  
  // Story 5 - Instantiate int to string two-way transformer
  
  save(MouseEvent e, var detail, Element target) => gameStoreService.save(game).then((_) => gotoPath("#/games"));
}
