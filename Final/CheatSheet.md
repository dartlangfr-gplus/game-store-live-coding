###`<link rel="import" href="game.html">`

###`eventHandler(Event e, var detail, Element target) => ...;`

###`onPropertyChange(this, #gameId, () => ...;`

###`dispatchEvent(new CustomEvent('delete', detail: game));`

------------------------------------------

#### 1. Afficher les données d’UN jeu
#### 2. Afficher la liste des jeux 
#### 3. Filtre / Tri sur la liste de jeux
#### 4. Template alternatif pour la liste de jeux
#### 5. Édition d’un jeu
#### 6. Single Page App : Liste / édition
#### 7. Ajout / Suppression d'un jeu
#### 8. Brancher sur un serveur existant 

------------------------------------------

#### 1. Afficher les données d’UN jeu (Dart)
- Créer le projet
- Copier le modèle
- Ajouter les scripts dart et `boot.js`
- Récupérer les éléments (1er + snippet)
- Modifier les éléments (1er + snippet)
- Ajouter un event de click

#### 1.bis Afficher les données d’UN jeu (Polymer)
- Importer et ajouter le composant dans `index.html`
- Ajouter une instance de jeu dans le composant
- Binder les champs
- Ajouter les filtres
- Ajouter l'évenement de click

#### 2. Afficher la liste des jeux 
- Afficher la liste des noms des jeux
- Importer et Réutiliser le composant `x-game` et lui passer le jeu
- Ajouter l'attribut @published

#### 3. Filtre / Tri sur la liste de jeux
- Binder l'attribut `search`
- Ajouter un filtre au binding et l'implémenter
- Ajouter le `on-click` sur les boutons de tri avec un `data-field`
- Récupérer le `field` et implémenter le tri

#### 4. Template alternatif pour la liste de jeux
- Décommenter l'autre template et ajouter le binding (Snippet)
- Ajouter le `on-click` sur le bouton compact
- Ajouter les template conditionnel
- Ajouter le toggle sur le style du bouton

#### 5. Édition d’un jeu
#### 6. Single Page App : Liste / édition
#### 7. Ajout / Suppression d'un jeu
#### 8. Brancher sur un serveur existant 
