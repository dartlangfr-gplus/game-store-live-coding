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
        var title = game.querySelector("#title");
        var genre = game.querySelector("#genre");
        var description = game.querySelector("#description");
        var image = game.querySelector("#image");
        var rating = game.querySelector("#rating");
        
        void main() {
          // Populate content
          title.text = "Darts".toUpperCase();
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
   _**`Project skeleton`**` / File template / Snippet`_

        <!DOCTYPE html>
        <polymer-element name="x-game">
          <template>
            <!-- ... -->
          </template>
          <script type="application/dart" src="game.dart"></script>
        </polymer-element>
- Create the associated `game.dart`  
   _**`Project skeleton`**` / File template / Snippet`_

        import 'dart:html';
        import 'package:polymer/polymer.dart';

        @CustomTag('x-game')
        class XGame extends PolymerElement {
          XGame.created() : super.created();

          bool get applyAuthorStyles => true;
        }
- In `index.html`, remove index.dart script tag and add  
   _**`Project skeleton`**_

        <link rel="import" href="game.html">
        
        <script type="application/dart">import 'package:polymer/init.dart';</script>
        <script src="packages/browser/dart.js"></script>
- Add the new web component

        <x-game></x-game>
- In `game.dart`, add a `Game` class  
   _**`Project skeleton`**` / Snippet`_

        class Game extends Object with Observable {
          @observable String name;
          @observable String genre;
          @observable String description;
          @observable String image;
          @observable int rating;
          
          bool contains(String search) {
            var pattern = new RegExp(search, caseSensitive: false);
            return name.contains(pattern) || genre.contains(pattern) || description.contains(pattern);
          }
          String toString() => "Game{name: $name}";
        }
- Add a `Game` instance  
   _**`Project skeleton`**` / `Snippet`_

        @observable Game game = new Game()
          ..name = "Darts"
          ..genre = "Pub game"
          ..description = 'Darts is ...'
          ..image = "darts.jpg"
          ..rating = 2;
- In `game.html`, add the game template  
   _**`Project skeleton`**` / `Snippet with binding to complete`_

        <div class="game">
          <img id="image" src="img/games/{{game.image}}" alt="Game picture" class="span2">
          <div>
              <h3>{{game.name}}</h3>
              <p><b>Genre:</b> {{game.genre}}</p>
              <p><b>Description:</b> {{game.description}}</p>
              <p><b>Rating:</b> {{game.rating}}</p>
          </div>
         </div>
- In `game.dart`, add filter and use them  
   _`Snippet`_

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
   _**`Project skeleton`**` / File template / Snippet`_
- In `index.html`, add the reference to the new web component
   _**`Project skeleton`**` / File template / Snippet / Uncomment / Replace`_

        <link rel="import" href="games.html">
- In `games.html`, import the `x-game` component and use it

        <link rel="import" href="game.html">

        <polymer-element name="x-games">
          <template>
            <template repeat="{{game in games}}">
              <x-game game="{{game}}"></x-game>
            </template>
          </template>
          <script type="application/dart" src="games.dart"></script>
        </polymer-element>
- In `games.dart`, add the `games` attributes with models instances

        @observable List games = models.games;
- In `game.dart`, `@published` the game attribute

        @published Game game;

Step 3 - Filter and sort on games list
------
- In `games.html`, add a search section and add the filter  
   _`Snippet the search section / Uncomment`_
 
        <section class="well form-inline">
            <input type="text" placeholder="Search" value="{{search}}" class="span5">
        </section>

        <template repeat="{{game in games | filterSearch(search)}}">
- In `games.dart`, add the `search` attribute and the filter function  
   _`Snippet`_

        @observable String search = "";
        
        filterSearch(String search) => (List list) => list.where((e) => e.contains(search));
