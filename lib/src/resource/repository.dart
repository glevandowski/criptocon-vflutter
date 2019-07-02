import 'package:criptocon/src/model/coin.dart';
import 'package:criptocon/src/api/criptocon_api_provider.dart';

class Repository {
  final criptoconApiProvider = CriptoconApiProvider();

  Future<List<Coin>> fetchAllCoins() => criptoconApiProvider.fetchCoinList();
}
