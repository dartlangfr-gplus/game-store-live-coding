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
        var note = game.querySelector("#note");
        
        void main() {
          // Populate content
          title.text = "Darts".toUpperCase();
          genre.text = "Pub game";
          description.text = "Darts is ...";
          image.src = "img/games/darts.jpg";
          note..text = "★★";
        }
- Add a click handler to increase the number of stars  
   _`Snippet for the star character`_

          note..text = "★★"
            ..onClick.capture((e) => note.text += "★");
- Refactor to `increaseNote`, add a breakpoint and test the debug mode

        increaseNote(e) => note.text += "★";
- Try dart2js

Step 1 Bis - Show game data (Polymer)
----------
- Add polymer package in `pubspec.yaml` (TODO: entryPoints ?)
- Create a `game.html` web component  
   _`Snippet / File template`_

        <!DOCTYPE html>
        <polymer-element name="x-game">
          <template>
            <!-- ... -->
          </template>
          <script type="application/dart" src="game.dart"></script>
        </polymer-element>
- Create the associated `game.dart`  
   _`Snippet / File template`_

        import 'dart:html';
        import 'package:polymer/polymer.dart';

        @CustomTag('x-game')
        class XGame extends PolymerElement {
          XGame.created() : super.created();

          bool get applyAuthorStyles => true;
        }
- In `index.html`, remove index.dart script tag and add

        <link rel="import" href="game.html">
        
        <script type="application/dart">import 'package:polymer/init.dart';</script>
- Add the new web component

        <x-game></x-game>
- In `game.dart`, add a `Game` class  
   _`Snippet`_

        class Game {
          String name;
          String genre;
          String description;
          String image;
          int note;
          
          String toString() => "Game{name: $name}";
        }
- Add a `Game` instance  
   _`Snippet`_

        @observable Game game = new Game()
          ..name = "Darts"
          ..genre = "Pub game"
          ..description = 'Darts is ...'
          ..image = "darts.jpg"
          ..note = 2;
- In `game.html`, add the game template  
   _`Snippet with binding to complete`_

        <div class="game">
          <img id="image" src="img/games/{{game.image}}" alt="Game picture" class="span2">
          <div>
              <h3>{{game.name}}</h3>
              <p><b>Genre:</b> {{game.genre}}</p>
              <p><b>Description:</b> {{game.description}}</p>
              <p><b>Note:</b> {{game.note}}</p>
          </div>
         </div>
- In `game.dart`, add filter and use them  
   _`Snippet`_

          String upperCase(String value) => value.toUpperCase();
          String stars(int count) => new List.generate(count, (i) => "★").join("");

- Add click handler to increase note  
   _`Snippet with the body to complete`_

          increaseNote(Event e, var detail, Node target) => game.note++;
          on-click="{{increaseNote}}"