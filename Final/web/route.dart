import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:route/client.dart';


@CustomTag('x-route')
class XRoute extends PolymerElement {
  // Whether styles from the document apply to the contents of the component
  bool get applyAuthorStyles => true;
  XRoute.created() : super.created() {
    var router = new Router()
      ..addHandler(gamesUrl, _routeHandler(gamesUrl))
      ..addHandler(gameUrl, _routeHandler(gameUrl))
      ..listen();
    
    currentUrl = gamesUrl;
  }
  
  final gamesUrl = new UrlPattern(r'/(.*)#/games');
  final gameUrl = new UrlPattern(r'/(.*)#/games/(\d+)');

  @observable UrlPattern currentUrl;
  @observable List params = [];

  Handler _routeHandler(UrlPattern url) => (String path) {
    print("Route changed: $url - $path");
    params = [];
    currentUrl = url;
    params = url.parse(path);
  };
  
  int asInt(String value) => int.parse(value);
}

