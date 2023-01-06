import 'package:bloc_cubit_example/bloc/companies/companies_cubit.dart';
import 'package:bloc_cubit_example/data/network/api_service.dart';
import 'package:bloc_cubit_example/data/repositories/car_repositories.dart';
import 'package:bloc_cubit_example/ui/home_page/home.dart';
import 'package:bloc_cubit_example/ui/page_one.dart';
import 'package:bloc_cubit_example/ui/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CompaniesCubit(
          CarRepository(
            apiservic: ApiService()..getAllCarModelOne(),
          ),
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
