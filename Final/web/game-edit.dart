import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart';
import 'services.dart';
import 'utils.dart';

@CustomTag('x-game-edit')
class XGameEdit extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XGameEdit.created() : super.created() {
    onPropertyChange(this, #gameId, () => game = gameStoreService.getById(gameId));
  }

  @published int gameId;
  @observable Game game;
  
  var asInt = new GenericTransformer((int v) => v.toString(), int.parse);
  
  // For later
  save(Event e, var detail, Element target) => gameStoreService.save(game);
}
