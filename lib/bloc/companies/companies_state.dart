import 'package:bloc_cubit_example/data/models/car_model.dart';

abstract class CompaniesState{}

class InitialCompaniesState extends CompaniesState{}

class LoadCompaniesInProgress extends CompaniesState{}

class LoadCompaniesInSucsecc extends CompaniesState{
  LoadCompaniesInSucsecc({required this.carModelOne});
  final CarModelOne carModelOne;
}
class LoadCompaniesFailure extends CompaniesState{
  LoadCompaniesFailure({required this.error});

  final String error;
}