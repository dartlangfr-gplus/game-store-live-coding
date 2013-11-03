import 'dart:html';
import 'package:polymer/polymer.dart';
import 'models.dart' as models;

@CustomTag('x-games')
class XGames extends PolymerElement {
  @observable Iterable games = models.games;
  @observable String search = "";
  @observable String sortField = "";
  @observable bool sortAscending = true;

  XGames.created() : super.created();

  bool get applyAuthorStyles => true;
  
  filterSearch(String search) => (Iterable games) => games.where((e) => e.contains(search));

  sort(Event e, var detail, Element target) {
    var field = target.dataset['field'];
    sortAscending = field == sortField ? !sortAscending : true;
    sortField = field;
  }

  sortBy(String field, bool ascending) => (Iterable games) {
    var list = games.toList()..sort(models.getComparator(field));
    return ascending ? list : list.reversed;
  };
}