import 'package:bloc_cubit_example/bloc/companies/companies_cubit.dart';
import 'package:bloc_cubit_example/bloc/companies/companies_state.dart';
import 'package:bloc_cubit_example/data/network/api_service.dart';
import 'package:bloc_cubit_example/data/repositories/car_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompaniesCubit(CarRepository(apiservic: ApiService())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Screen 2"),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<CompaniesCubit>().fetchAllData();
                },
                icon: const Icon(Icons.upload))
          ],
        ),
        body: BlocBuilder<CompaniesCubit, CompaniesState>(
            builder: (context, state) {
          if (state is InitialCompaniesState) {
            return const Center(
              child: Text("hozircha data yo'q"),
            );
          } else if (state is LoadCompaniesInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadCompaniesInSucsecc) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(top: 4),
                  margin: const EdgeInsets.only(
                      top: 6, left: 4, right: 4, bottom: 2),
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Center(
                          child: Text(state.carModelOne.data[index].carModel
                              .toString())),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        width: double.infinity,
                        height: 143,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          image: DecorationImage(
                              image: NetworkImage(state
                                  .carModelOne.data[index].logo
                                  .toString()),
                              fit: BoxFit.fill,
                              scale: 6),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is LoadCompaniesFailure) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(fontSize: 24, color: Colors.red),
              ),
            );
          }
          return const Text("oxirgi returnga tushdi");
        }),
      ),
    );
  }
}
