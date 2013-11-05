Game store live-coding
======================

Step 1 - Show game data (Dart only)
------
- Create a new Dart Web project
- Copy model files
- Let the game block only, comment the others and remove the sample text
- Add the script tags in `index.html`  
  _`Snippet`_

        <script type="application/dart" src="index.dart"></script>
        <script src="packages/browser/dart.js"></script>
- Create or edit `index.dart` to populate content  
  _`Snippet list of querySelector and populate content (except a first exemple for each)`_

        import 'dart:html';
        
        // Retrieve DOM elements
        var game = querySelector("#game");
        var name = game.querySelector("#name");
        var genre = game.querySelector("#genre");
        var description = game.querySelector("#description");
        var image = game.querySelector("#image");
        var rating = game.querySelector("#rating");
        
        void main() {
          // Populate content
          name.text = "Darts".toUpperCase();
          genre.text = "Pub game";
          description.text = "Darts is ...";
          image.src = "img/games/darts.jpg";
          rating..text = "★★";
        }
- Add a click handler to increase the number of stars  
   _`Snippet for the star character`_

          rating..text = "★★"
            ..onClick.capture((e) => rating.text += "★");
- Refactor to `increaseRating`, add a breakpoint and test the debug mode

        increaseRating(e) => rating.text += "★";
- Try dart2js

Step 1 Bis - Show game data (Polymer)
----------
- Add polymer package in `pubspec.yaml` and add entry_points  
   _**`Project skeleton`**_

        dependencies:
          polymer: any
        
        # For 0.8.8
        transformers:
        - polymer:
            entry_points: web/index.html
- Create a `game.html` web component  
   _**`Project skeleton`**_

        <!DOCTYPE html>
        <polymer-element name="x-game">
          <template>
            <!-- With the copy of the model template -->
          </template>
          <script type="application/dart" src="game.dart"></script>
        </polymer-element>
- Create the associated `game.dart`  
   _**`Project skeleton`**_

        import 'dart:html';
        import 'package:polymer/polymer.dart';

        @CustomTag('x-game')
        class XGame extends PolymerElement {
          // Whether styles from the document apply to the contents of the component
          bool get applyAuthorStyles => true;
          XGame.created() : super.created();
        }
- In `index.html`, remove index.dart script tag and add  
   _**`Project skeleton`**_

        <script type="application/dart">import 'package:polymer/init.dart';</script>
        <script src="packages/browser/dart.js"></script>
- Add the new web component  
   _`Snippet link`_

        <link rel="import" href="game.html">

        <x-game></x-game>
- In `game.html`, add the game template  
   _**`Project skeleton`**` with binding to complete`_

        <div class="game">
          <img id="image" src="img/games/{{game.image}}" alt="Game picture" class="span2">
          <div>
              <h3>{{game.name}}</h3>
              <p><b>Genre:</b> {{game.genre}}</p>
              <p><b>Description:</b> {{game.description}}</p>
              <p><b>Rating:</b> {{game.rating}}</p>
          </div>
         </div>
- In `game.dart`, add a `game` attribute with a `Game` instance  

        @observable Game game = gameStoreService.getById(1);
- In `game.dart`, add filter and use them  
   _`Snippet for stars`_

          String upperCase(String value) => value.toUpperCase();
          String stars(int count) => new List.generate(count, (i) => "★").join("");

- Add click handler to increase rating  
   _`Snippet with the body to complete`_

          increaseRating(Event e, var detail, Node target) => game.rating++;
          on-click="{{increaseRating}}"
          
Step 2 - Show games list
------
- Create a `models.dart` with the `Game` class and some instances  
   _**`Project skeleton`**_
- Create a `games.html` and `games.dart` web component   
   _**`Project skeleton`**` with the copy of the model template`_
- In `index.html`, add the reference to the new web component

        <link rel="import" href="games.html">
        
        <x-games></x-games>
- In `games.html`, use a repeat template and show game names

        <polymer-element name="x-games">
          <template>
            <h3>Games</h3>

            <template repeat="{{game in games}}">
              {{game.name}}<br/>
            </template>
          </template>
          <script type="application/dart" src="games.dart"></script>
        </polymer-element>
- In `games.dart`, add the `games` attributes with models instances

        @observable List<Game> games = gameStoreService.getAll();
- In `games.html`, import the `x-game` component and use it

        <link rel="import" href="game.html">

        <polymer-element name="x-games">
          <template>
            <h3>Games</h3>

            <template repeat="{{game in games}}">
              <div class="games">
                <x-game game="{{game}}"></x-game>
              </div>
            </template>
          </template>
          <script type="application/dart" src="games.dart"></script>
        </polymer-element>
- In `game.dart`, `@published` the game attribute

        @published Game game;

Step 3 - Filter and sort on games list
------
- In `games.html`, add a search section and add the filter  
   _**`Project skeleton`**` except for the bindings`_
 
        <section class="well form-inline">
            <input type="text" placeholder="Search" value="{{search}}" class="span5">
        </section>

        <template repeat="{{game in games | filterSearch(search)}}">
- In `games.dart`, add the `search` attribute and the filter function

        @observable String search = "";
        
        filterSearch(String search) => (List games) => games.where((e) => e.contains(search));
- In `games.html`, add sort buttons and add the filter  
   _**`Project skeleton`**` except for the bindings and data-xxx`_

        <section class="pull-right">
            <button class="btn btn-info" on-click="{{sort}}" data-field="name">Sort by name</button>
            <button class="btn btn-info" on-click="{{sort}}" data-field="rating">Sort by rating</button>
        </section>
    
        <template repeat="{{game in games | filterSearch(search) | sortBy(sortField, sortAscending)}}">

- In `games.dart`, add the `sort` handler and the filter function  
   _**`Skeleton project`**` except for the target.dataset['field'] to implement`_

        sort(Event e, var detail, Element target) {
          var field = target.dataset['field'];
          sortAscending = field == sortField ? !sortAscending : true;
          sortField = field;
        }
      
        sortBy(String field, bool ascending) => (Iterable games) {
          var list = games.toList()..sort(Game.getComparator(field));
          return ascending ? list : list.reversed;
        };

Step 4 - Alternative template
------
- In `games.html`, create and test the alternative template (copy `stars` method)
   _**`Project skeleton ?`**` / Snippet / Uncomment ?`_

        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Genre</th>
                <th>Rating</th>
            </tr>
            </thead>
            <tbody>
             <template repeat="{{game in games | filterSearch(search) | sortBy(sortField, sortAscending)}}">
                <tr>
                    <td>{{game.name}}</td>
                    <td>{{game.genre}}</td>
                    <td>{{game.rating | stars}}</td>
                </tr>
             </template>
            </tbody>
        </table> 
- In `games.html`, add a switch button and add the switch templates  
   _`Snippet the class binding / Uncomment ?`_

        <button class="btn btn-success" on-click="{{compact}}"><i class="{{ {'icon-th-list icon-white' : !isCompact , 'icon-th icon-white' : isCompact } }}"></i></button>

        <template if="{{!isCompact}}">
           ...
        </template>
        <template if="{{isCompact}}">
           ...
        </template>
- In `games.dart`, add the `isCompact` attribute and the `compact` handler  
   _**`Project skeleton ?`**` / Snippet / Uncomment ?`_

        @observable bool isCompact = true;
        
        compact(Event e, var detail, Element target) => isCompact = !isCompact;  
        
Step 5 - Edit game
------
- Create a new component `game-edit.html` / `game-edit.dart`  
   _**`Project skeleton` except for the bindings**_
- In `index.html`, add the new component

        <link rel="import" href="game-edit.html">
    
        <x-game-edit gameId="1"></x-game-edit>

- In `game-edit.html`, add the bindings
- In `game-edit.dart`, add a `Game` instance and add the `asInt` transforme
   _`Snippet for asInt with parameters to complete`_

        @observable Game game = gameStoreService.getById(1);
        
        var asInt = new GenericTransformer((int v) => v.toString(), int.parse);
- In `game-edit.dart`, add the `gameId` attribute and add the `onPropertyChange`  
   _**`Project skeleton ?`**` / Snippet for onPropertyChange with parameters to complete`_

        XGameEdit.created() : super.created() {
          onPropertyChange(this, #gameId, loadGame);
        }

        @published int gameId = null;
        @observable Game game = new Game();
        
        loadGame() => game = gameId == null? new Game() : gameStoreService.getById(gameId);

Step 6 - Single page app, URL routing
------
- Create a new component `route.html` / `route.dart`    
   _**`Project skeleton`**` completely for route.dart, without conditional templates but with the components in route.html`_
- In `index.html`, add the new component
 
        <link rel="import" href="route.html">
    
        <x-route></x-route>
- In `route.html`, add the conditional template and the params
        
        <template if="{{currentUrl == gamesUrl}}">
          <x-games></x-games>
        </template>
        <template if="{{currentUrl == gameUrl || route.url == newGameUrl}}">
          <x-game-edit gameId="{{params[1] | asInt}}"></x-game-edit>
        </template>

Step 7 - Add / Delete game
------
- In `route.html`, add a the route to `newGameUrl`

        <template if="{{currentUrl == gameUrl || route.url == newGameUrl}}">

- In `game-edit.dart`, add a `save` event

        save(Event e, var detail, Element target) => gameStoreService.save(game);

- In `game.dart`, add a `delete` event (Doesn't work because ...)

        delete(Event e, var detail, Element target) => gameStoreService.delete(game.id);

- Fire a custom event instead

        delete(Event e, var detail, Element target) => dispatchEvent(new CustomEvent('delete', detail: game));

- In `games.dart` and `games.html`, add a `delete` event

        <x-game game="{{game}}" on-delete="{{delete}}"></x-game>
  
        delete(Event e, Game game, Element target) {
          gameStoreService.delete(game.id);
          loadGames();
        }
        loadGames() => games = gameStoreService.getAll();

Step 8 - Persist using a rest API
------
- In `services.dart`, reimplement with rest calls
   _**`Snippet`**` except for the first one`_

  Future<List<Game>> getAll() => HttpRequest.getString("api/games.json").then(JSON.decode).then((List list) => list.map(Game.fromMap).toList());
  Future<Game> getById(int id) => HttpRequest.getString("api/games/$id.json").then(JSON.decode).then(Game.fromMap);
  Future<Game> save(Game game) => HttpRequest.request("api/games.json", method: "PUT", sendData: JSON.encode(game.toMap())).then((r) => JSON.decode(r.response)).then(Game.fromMap);
  Future<Game> delete(int id) => HttpRequest.request("api/games/$id.json", method: "DELETE").then((r) => JSON.decode(r.response)).then(Game.fromMap);
