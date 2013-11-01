Game store live-coding
======================

Step 1 - Show game data (Dart only)
------
- Create a new Dart Web project
- Copy model files
- Let the game block only, comment the others and remove the sample text
- Add the script tags in index.html - _`Snippet`_

        <script type="application/dart" src="index.dart"></script>
        <script src="packages/browser/dart.js"></script>
- Create index.dart to populate content - _`Snippet list of querySelector to populate`_

        import 'dart:html';
        
        void main() {
          //  Query "Game"
          var game = querySelector("#game");
          
          // Populate content
          game.querySelector("#image").src = "img/games/darts.jpg";
          game.querySelector("#title").text = "Darts".toUpperCase();
          game.querySelector("#genre").text = "Pub games";
          game.querySelector("#description").text = "Darts description";
          game.querySelector("#note").text = "★★";
        }
- Add a click handler to increase the number of stars

		  var note = game.querySelector("#note");
		  note..text = "★★"
		    ..onClick.capture((e) => note.text += "★");

Step 1 Bis - Show game data (Polymer)
----------
