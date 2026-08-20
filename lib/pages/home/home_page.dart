import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_dev_flutter/cubit/census_name_cubit.dart';
import 'package:teste_dev_flutter/cubit/census_name_state.dart';
import 'package:teste_dev_flutter/pages/home/widgets/census_name_card.dart';
import 'package:teste_dev_flutter/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerName = TextEditingController();

  void _buscar() {
    context.read<CensusNameCubit>().fetchCensusName(_controllerName.text);
  }

  @override
  void dispose() {
    _controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Census IBGE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite um nome...',
                        suffixIcon: IconButton(
                          onPressed: _buscar,
                          icon: Icon(Icons.search),
                        ),
                      ),
                      onSubmitted: (_) => _buscar(),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: BlocBuilder<CensusNameCubit, CensusNameState>(
                        builder: (context, state) {
                          if (state is CensusNameLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is CensusNameLoaded) {
                            return ListView.builder(
                              itemCount: state.names.length,
                              itemBuilder: (context, index) {
                                final censusName = state.names[index];
                                return CensusNameCard(
                                  name: censusName,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.detail,
                                      arguments: censusName,
                                    );
                                  },
                                );
                              },
                            );
                          } else if (state is CensusNameError) {
                            return Center(
                              child: Text(
                                state.message,
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          }
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_search,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Digite um nome para buscar',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
