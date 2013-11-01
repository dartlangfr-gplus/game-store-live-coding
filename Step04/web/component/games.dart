library game_store.components.game.games;

import 'package:polymer/polymer.dart';
import 'package:gamestore_04/entity.dart';

@CustomTag('x-games')
class XGames extends PolymerElement {
  
  XGames.created() : super.created();

  @observable Game game = DARTS;
  
}
