import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sw_fun_app/core/model/base_response_model.dart';

part 'base_datasource.g.dart';

@RestApi()
abstract class BaseDataSource<T> {
  factory BaseDataSource(Dio dio, {String baseUrl}) = _BaseDataSource;

  @GET('/{collection}/')
  Future<BaseResponseModel<T>> getCollection(
      @Path('collection') String collection,
      @Query('page') int page,
      Function fromJson);
}
