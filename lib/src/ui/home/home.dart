import 'package:criptocon/src/bloc_helpers/builder/bloc_state_builder.dart';
import 'package:criptocon/src/blocs/list/list_coins_bloc.dart';
import 'package:criptocon/src/blocs/list/list_coins_state.dart';
import 'package:criptocon/src/model/coin.dart';
import 'package:criptocon/src/bloc_helpers/provider/bloc_provider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocEventStateBuilder<ListCoinsState>(
            bloc: BlocProvider.of<ListCoinsBloc>(context),
            builder: (BuildContext context, ListCoinsState state) {
              if (!state.isInitialized) {
                return Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.blueGrey));
              }
             return buildList(state.coins);
            })
    );
  }

  ListView buildList(List<Coin> listCoin) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                      child: Text(
                        listCoin[position].symbol,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        listCoin[position].name,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        listCoin[position].lastHistorical,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.star_border,
                          size: 35.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
      itemCount: listCoin.length,
    );
  }
}
