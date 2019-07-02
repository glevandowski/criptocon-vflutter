import 'package:criptocon/src/bloc_helpers/builder/bloc_state_builder.dart';
import 'package:criptocon/src/blocs/application/application_bloc.dart';
import 'package:criptocon/src/blocs/application/application_event.dart';
import 'package:criptocon/src/blocs/application/application_state.dart';
import 'package:criptocon/src/blocs/list/list_coins_bloc.dart';
import 'package:criptocon/src/blocs/list/list_coins_event.dart';
import 'package:criptocon/src/bloc_helpers/provider/bloc_provider.dart';
import 'package:criptocon/src/ui/home/home.dart';
import 'package:criptocon/src/ui/settings/settings.dart';
import 'package:criptocon/src/ui/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin  {
  ApplicationBloc initBloc;
  TabController controller;

  @override
  void initState(){
    super.initState();
    initBloc = ApplicationBloc();
    initBloc.emitEvent(ApplicationInitializationEvent());
    BlocProvider.of<ListCoinsBloc>(context).emitEvent(ListCoinsEvent());
    controller = new TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  void dispose(){
    initBloc?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext pageContext) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: BlocEventStateBuilder<ApplicationInitializationState>(
              bloc: initBloc,
              builder: (BuildContext context, ApplicationInitializationState state){
                if (state.isInitialized){
                  return TabBarView(
                    children: <Widget>[
                      Wallet(title: "Criptocon"),
                      Home(),
                      Settings(title: "Criptocon")
                    ],
                    controller: controller,
                  );
                }
                return Text('${state.progress}%');
              },
            ),
          ),
        ),
          bottomNavigationBar: Material(
              color: Colors.blueGrey,
              child: TabBar(
                  indicatorColor: Colors.white,
                  tabs: <Tab>[
                    Tab(
                      icon: Icon(Icons.account_balance_wallet),
                    ),
                    Tab(
                      icon: Icon(Icons.donut_small),
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                    ),
                  ],
                  controller: controller)))
    );
  }
}