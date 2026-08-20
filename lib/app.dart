import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_dev_flutter/core/services/census_name_service.dart';
import 'package:teste_dev_flutter/cubit/census_name_cubit.dart';
import 'package:teste_dev_flutter/pages/details/details_page.dart';
import 'package:teste_dev_flutter/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CensusNameCubit(CensusNameService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Census IBGE',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: {'/': (_) => const HomePage(), '/detail': (_) => DetailsPage()},
      ),
    );
  }
}
