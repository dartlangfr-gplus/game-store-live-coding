import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart' as models;

@CustomTag('x-games')
class XGames extends PolymerElement {
  @observable List games = models.games;

  @observable String search = "";

  XGames.created() : super.created();

  bool get applyAuthorStyles => true;
  
  filterSearch(String search) => (List list) => list.where((e) => e.contains(search));
}