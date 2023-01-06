import 'package:bloc_cubit_example/data/models/car_model.dart';
import 'package:bloc_cubit_example/data/models/my_response.dart';
import 'package:bloc_cubit_example/data/network/api_client.dart';
import 'package:dio/dio.dart';


class ApiService extends  ApiClient {

  Future<MyResponse> getAllCarModelOne() async{
    MyResponse myResponse = MyResponse(error: "");
    Response response = await dio.get("${dio.options.baseUrl}/companies");
    try{
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        myResponse.data = CarModelOne.fromJson(response.data);
      }
    }catch(e){
      myResponse.error = e.toString();
    }
    return myResponse;
  }

}