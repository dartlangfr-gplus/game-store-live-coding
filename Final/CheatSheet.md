eventHandler(Event e, var detail, Element target) =>

onPropertyChange(this, #gameId, () => game = gameStoreService.getById(gameId));