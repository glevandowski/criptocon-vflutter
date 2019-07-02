import 'dart:convert';
import 'package:criptocon/src/model/coin.dart';
import 'package:http/http.dart' show Client;

class CriptoconApiProvider {
  Client client = Client();
  final apiKey = '';

  Future<List<Coin>> fetchCoinList() async {
    final response = await client.get(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map",
        headers: {
          "Accept": " application/json",
          "X-CMC_PRO_API_KEY": " $apiKey"
        });

    print(response.body.toString());
    if (response.statusCode == 200) {
      return new Coin().parseJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
