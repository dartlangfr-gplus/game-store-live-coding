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
  _`Snippet list of querySelector and populate content (expect a first exemple for each)`_

        import 'dart:html';
        
        // Retrieve DOM elements
        var game = querySelector("#game");
        var image = game.querySelector("#image");
        var title = game.querySelector("#title");
        var genre = game.querySelector("#genre");
        var description = game.querySelector("#description");
        var note = game.querySelector("#note");
        
        void main() {
          // Populate content
          title.text = "Darts".toUpperCase();
          genre.text = "Pub games";
          description.text = "Darts description";
          image.src = "img/games/darts.jpg";
          note..text = "★★"
            ..onClick.capture(increaseNote);
        }
- Add a click handler to increase the number of stars  
   _`Snippet for the star character`_

		  var note = game.querySelector("#note");
		  note..text = "★★"
		    ..onClick.capture((e) => note.text += "★");
- Refactor to `increaseNote`, add a breakpoint and test the debug mode

		increaseNote(e) => note.text += "★"; 

Step 1 Bis - Show game data (Polymer)
----------
