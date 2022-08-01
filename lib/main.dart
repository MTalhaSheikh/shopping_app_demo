import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/navigations/locator.dart';
import 'core/navigations/navigator_services.dart';
import 'core/navigations/routing.dart';
import 'features/number_trivia/data/data_sources/local_data/commen/constants.dart';
import 'features/number_trivia/presentation/appearance/appearance_provider.dart';
import 'features/number_trivia/presentation/appearance/light_appearance.dart';
import 'features/number_trivia/presentation/bloc/cartBloc/cart_bloc.dart';
import 'features/number_trivia/presentation/bloc/counter/counter_bloc.dart';
import 'features/number_trivia/presentation/pages/dashboard_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => CounterBloc(),
              ),
              BlocProvider(
                create: (BuildContext context) => CartBloc(),
              ),
            ],
          child: AppearanceProvider(
            appearance: LightAppearance(),
            child: Builder(
              builder: (ctz) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: Theme.of(context).copyWith(
                    colorScheme: Theme
                        .of(context)
                        .colorScheme
                        .copyWith(
                      primary: Colors.white70,
                    ),
                  ),
                  initialRoute: Constants.dashboardScreen,
                  navigatorKey: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: RouteGenerator.generateRoute,
                  routes: {
                    Constants.dashboardScreen: (context) => const DashboardPage(),
                  },
                );
              },
            ),
          )
        );
      },
    );
  }
}