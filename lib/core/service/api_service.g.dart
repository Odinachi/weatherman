// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.openweathermap.org/data/2.5/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<DataResponseModel> getDatabyCoord({lat, lon, apiKey, unit}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataResponseModel>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'onecall?lat=${lat}&lon=${lon}&appid=${apiKey}&unit=${unit}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<SearchResponseModel> searchLocation({location}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        SearchResponseModel>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '${location}.json?typeahead=true&key=yZdTGKubKAcPP3TlQ0a6qDvmmUG8AzDW',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchResponseModel.fromJson(_result.data);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
