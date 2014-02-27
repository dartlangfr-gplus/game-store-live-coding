###`<link rel="import" href="game.html">`

###`eventHandler(Event e, var detail, Element target) => ...;`

###`onPropertyChange(this, #gameId, () => ...);`

###`dispatchEvent(new CustomEvent('delete', detail: game));`

### `★` = `\u2605`

------------------------------------------

#### 1. Afficher les données d’UN jeu
#### 2. Afficher la liste des jeux 
#### 3. Filtre / Tri sur la liste des jeux
#### 4. Template alternatif pour la liste des jeux
#### 5. Édition d’un jeu
#### 6. Single Page App : Liste / édition
#### 7. Ajout / Suppression d'un jeu
#### 8. Brancher sur un serveur existant 

------------------------------------------

#### 1. Afficher les données d’UN jeu (Dart)
- Créer le projet
- Copier le modèle
- Ajouter les scripts dart et `boot.js`
- Récupérer leséléments et modifier un style pour ex (1er `game` + **snippet**)
- Modifier les éléments (1er `name` + **snippet**)
- Ajouter un event de click sur `rating` + **factorisation de la méthode**

#### 1.bis Afficher les données d’UN jeu (Polymer)
- Importer et ajouter le composant dans `index.html`
- Ajouter une instance de jeu dans le composant
- Binder les champs
- Ajouter les filtres (**Snippet pour `stars`**)
- Ajouter l'évenement de click (**`@observable`** !!)

#### 2. Afficher la liste des jeux 
- Afficher la liste des noms des jeux
- Importer et Réutiliser le composant `x-game` et lui passer le jeu
- Ajouter l'attribut `@published`

#### 3. Filtre / Tri sur la liste des jeux
- Binder l'attribut `search`
- Ajouter un filtre au binding et l'implémenter
- Ajouter le `on-click` sur les boutons de tri avec un `data-field`
- Récupérer le `field` et implémenter le tri

#### 4. Template alternatif pour la liste des jeux
- Décommenter l'autre template et ajouter le binding (Snippet)
- Ajouter le `on-click` sur le bouton compact
- Ajouter les templates conditionnels
- Ajouter le toggle sur le style du bouton (**Snippet**)

#### 5. Édition d’un jeu
- Importer et ajouter le composant **sans `gameId`** dans `index.html`
- Ajouter **un `gameId`** et faire le chargement du jeu
- Ajouter le transformer car erreur

#### 6. Single Page App : Liste / édition
- Importer et ajouter le composant `x-route` dans `index.html`
- Ajouter les templates conditionnels

#### 7. Ajout / Suppression d'un jeu
- Ajouter le `on-click` sur le bouton save
- Ajouter le `on-click` sur le bouton delete et lancer un `CustomEvent`
- Récupérer l'event dans `games.html` et le binder sur la function `delete`

#### 8. Brancher sur un serveur existant 
- Réimplémenter le service avec des appels Rest (1er + **snippet**)
