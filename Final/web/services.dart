library game_store.service;

import 'dart:async';
import 'dart:html';
import 'dart:convert';
import 'package:game_store/models.dart';

class GameStoreService {
  Future<List<Game>> getAll() => HttpRequest.getString("api/games.json").then(JSON.decode).then((List list) => list.map(Game.fromMap).toList());
  Future<Game> getById(int id) => HttpRequest.getString("api/games/$id.json").then(JSON.decode).then(Game.fromMap);
  Future<Game> save(Game game) => HttpRequest.request("api/games.json", method: "PUT", sendData: JSON.encode(game.toMap())).then((r) => JSON.decode(r.response)).then(Game.fromMap);
  Future<Game> delete(int id) => HttpRequest.request("api/games/$id.json", method: "DELETE").then((r) => JSON.decode(r.response)).then(Game.fromMap);
}

final GameStoreService gameStoreService = new GameStoreService();