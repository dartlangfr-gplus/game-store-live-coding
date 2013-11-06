eventHandler(Event e, var detail, Element target) =>

onPropertyChange(this, #gameId, () => game = gameStoreService.getById(gameId));

<link rel="import" href="game.html">

dispatchEvent(new CustomEvent('delete', detail: game));