import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart';
import 'services.dart';
import 'utils.dart';

@CustomTag('x-game-edit')
class XGameEdit extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XGameEdit.created() : super.created();

  @observable Game game = gameStoreService.getById(1);
  
  var asInt = new GenericTransformer((int v) => v.toString(), (String t) => int.parse(t));
  
  save(Event e, var detail, Element target) => gameStoreService.save(game);
}

