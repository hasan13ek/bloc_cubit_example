import 'package:bloc_cubit_example/bloc/companies/companies_state.dart';
import 'package:bloc_cubit_example/data/models/my_response.dart';
import 'package:bloc_cubit_example/data/repositories/car_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesCubit extends Cubit<CompaniesState>{
  CompaniesCubit(this.carRepository) : super(InitialCompaniesState()){

    fetchAllData();

  }

   final CarRepository carRepository;

  fetchAllData() async {
    emit(LoadCompaniesInProgress());
    MyResponse myResponse = await carRepository.getAllData();
    if(myResponse.error.isEmpty){
      emit(LoadCompaniesInSucsecc(carModelOne: myResponse.data));
    }else{
      emit(LoadCompaniesFailure(error: myResponse.error));
    }
  }
}