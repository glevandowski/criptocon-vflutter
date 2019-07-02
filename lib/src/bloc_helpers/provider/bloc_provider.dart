import 'package:flutter/material.dart';

Type typeOf<T>() => T;

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  BlocProviderState<T> createState() => BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = typeOf<BlocProviderInherited<T>>();
    BlocProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }
}

class BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class BlocProviderInherited<T> extends InheritedWidget {
  BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(BlocProviderInherited oldWidget) => false;
}
