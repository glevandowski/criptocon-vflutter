class Coin {
  var idCoin = "";
  var name = "";
  var symbol = "";
  var websiteSlug = "";
  var isActive = true;
  var firstHistorical = "";
  var lastHistorical = "";

  List<Coin> parseJson(Map<String, dynamic> result) {
    List<Coin> coins = List();
    result['data'].forEach((val) {
      Coin coin = Coin();
      coin.idCoin = val['id'].toString();
      coin.name = val['name'].toString();
      coin.symbol = val['symbol'].toString();
      coin.websiteSlug = val['slug'].toString();
      coin.isActive = val['is_active'].toString() == "true" ? true : false;
      coin.firstHistorical = val['first_historical_data'].toString();
      coin.lastHistorical = val['last_historical_data'].toString();
      coins.add(coin);
    });
    return coins;
  }
}
