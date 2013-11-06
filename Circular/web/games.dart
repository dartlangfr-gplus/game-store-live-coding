import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:game_store/models.dart';
import 'services.dart';

@CustomTag('x-games')
class XGames extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XGames.created() : super.created() {
    loadGames();
  }

  @observable List<Game> games = [];

  loadGames() => gameStoreService.getAll().then((result) => games = result);

  // Search task
  @observable String search = "";
  // Story 3 - Implement the search filter

  // Sort task
  @observable String sortField = "";
  @observable bool sortAscending = true;

  sort(Event e, var detail, Element target) {
    // Story 3 - Retrieve the field from the element
    var field = "";
    sortAscending = field == sortField ? !sortAscending : true;
    sortField = field;
  }

  sortBy(String field, bool ascending) => (Iterable games) {
    // Story 3 - Sort the list by the given field 
    List<Game> list = [];
    return ascending ? list : list.reversed;
  };

  // Alternative template task
  @observable bool isCompact = false;
  compact(Event e, var detail, Element target) => isCompact = !isCompact;
  
  // Delete custom event handler to delete the game and reload the list 
  delete(Event e, Game game, Element target) => gameStoreService.delete(game.id).then((_) => loadGames());

  // MISC
  String stars(int count) => new List.generate(count, (i) => "★").join("");
}