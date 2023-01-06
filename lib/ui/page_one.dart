import 'package:bloc_cubit_example/bloc/companies/companies_cubit.dart';
import 'package:bloc_cubit_example/bloc/companies/companies_state.dart';
import 'package:bloc_cubit_example/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<CompaniesCubit>(context).fetchAllData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<CompaniesCubit>(context).fetchAllData();
              },
              icon: const Icon(Icons.upload))
        ],
      ),
      body: BlocConsumer<CompaniesCubit,CompaniesState>(
          builder: (context,state){

            if(state is InitialCompaniesState){
              return const Center(child: Text("hali data yo'q"),);
            }else if(state is LoadCompaniesInProgress){
              // return MyUtils.showLoader(context);
              return const Center(child: CircularProgressIndicator());
            }else if(state is LoadCompaniesInSucsecc){
              return GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 8,
                itemBuilder:
                    (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 4),
                    margin: const EdgeInsets.only(top: 6,left: 4,right: 4,bottom: 2),
                    width: 120,
                    height: 180,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.grey),
                        borderRadius:
                        BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Center(child: Text(state.carModelOne.data[index].carModel.toString())),
                        const SizedBox(height: 4,),
                        Container(width: double.infinity,height: 1,color: Colors.grey,),
                        Container(
                          width: double.infinity,
                          height: 143,
                          decoration:  BoxDecoration(
                            borderRadius:const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)
                            ),
                            image: DecorationImage(image:
                            NetworkImage(
                                state.carModelOne.data[index].logo.toString()),
                                fit: BoxFit.fill,scale: 6),
                          ),
                        )
                      ],),
                  );
                },
              );
            }else if(state is LoadCompaniesFailure){
              return Center(child: Text(state.error,style: const TextStyle(fontSize: 24,color: Colors.red),),);
            }

            return const SizedBox();
          },
          listener:(context,state){
            if(state is LoadCompaniesInSucsecc){
              MyUtils.getMyToast(message: state.carModelOne.data.length.toString());
            }else{
              MyUtils.getMyToast(message: "Xatolik yuz berdi!!");
            }

      } ),
    );
  }
}
