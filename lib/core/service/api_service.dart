import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weatherman/core/model/data_response_model.dart';
import 'package:weatherman/core/model/search_response_model.dart';
import 'package:weatherman/core/service/urls.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: URLs.baseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) =>
      _ApiService(dio, baseUrl: baseUrl);

  @GET("onecall?lat={lat}&lon={lon}&appid={apiKey}&unit={unit}")
  Future<DataResponseModel> getDatabyCoord({
    @Path("lat") String lat,
    @Path("lon") String lon,
    @Path("apiKey") String apiKey,
    @Path("unit") String unit,
  });

  @GET("{location}.json?typeahead=true&key=${URLs.searchApikey}")
  Future<SearchResponseModel> searchLocation(
      {@Path("location") String location});
}
