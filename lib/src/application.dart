import 'package:criptocon/src/bloc_helpers/provider/bloc_provider.dart';
import 'package:criptocon/src/ui/settings/settings.dart';
import 'package:criptocon/src/ui/splashscreen/splashscreen_page.dart';
import 'package:criptocon/src/ui/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blocs/list/list_coins_bloc.dart';
import 'ui/home/home.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListCoinsBloc>(
      bloc: ListCoinsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          '/home': (BuildContext context) => Home(),
          '/wallet': (BuildContext context) => Wallet(),
          '/settings': (BuildContext context) => Settings(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
