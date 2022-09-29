import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';
import 'package:sw_fun_app/features/peoples/data/models/people_model.dart';

part 'peoples_datasource.g.dart';

@RestApi()
abstract class PeoplesDataSource {
  factory PeoplesDataSource(Dio dio, {String baseUrl}) = _PeoplesDataSource;

  @GET('/people/')
  Future<BaseResponseModel<PeopleModel>> getPeoples(@Query('page') int page);
}
