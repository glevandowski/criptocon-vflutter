import 'package:criptocon/src/bloc_helpers/event/bloc_event_state.dart';
import 'package:criptocon/src/model/coin.dart';
import 'package:meta/meta.dart';

class ListCoinsState extends BlocState {
  ListCoinsState({
    @required this.isInitialized,
    @required this.coins,
  });

  final bool isInitialized;
  final List<Coin> coins;

  factory ListCoinsState.notInitialized() {
    return ListCoinsState(
      coins: List(),
      isInitialized: false,
    );
  }

  factory ListCoinsState.progressing(List<Coin> listCoins) {
    return ListCoinsState(isInitialized: true, coins: listCoins);
  }

  factory ListCoinsState.initialized() {
    return ListCoinsState(isInitialized: true, coins: List());
  }
}
