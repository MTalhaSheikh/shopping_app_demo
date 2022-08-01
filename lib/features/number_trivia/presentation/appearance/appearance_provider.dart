import 'package:flutter/widgets.dart';
import 'appearance.dart';

class AppearanceProvider extends InheritedWidget {
  const AppearanceProvider({
    Key? key,
    required this.appearance,
    required Widget child,
  }) : super(key: key, child: child);

  final Appearance appearance;

  static Appearance of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<AppearanceProvider>()
            as AppearanceProvider;
    return widget.appearance;
  }

  @override
  bool updateShouldNotify(AppearanceProvider old) {
    return old.appearance != old.appearance;
  }
}
