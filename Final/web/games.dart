import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart' as models;

@CustomTag('x-games')
class XGames extends PolymerElement {
  @observable List games = models.games;
  
  XGames.created() : super.created();

  bool get applyAuthorStyles => true;
}