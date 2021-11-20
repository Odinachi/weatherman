import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherman/core/model/data_response_model.dart';
import 'package:weatherman/core/model/search_result/search_result.dart';
import 'package:weatherman/core/service/api_service.dart';
import 'package:weatherman/core/service/location_service.dart';
import 'package:weatherman/core/service/urls.dart';

class LocationGetter with ChangeNotifier {
  LocationService _locationService = LocationService.instance;

  Position _currentLocation;
  Placemark _place;
  DataResponseModel _dataResponseModel;
  List<SearchResult> _searchList;
  bool _showError;
  bool _isLoading = true;

  void getCurrentLocation() {
    _locationService.determinePosition().then((value) {
      if (value != null) {
        _currentLocation = value;
        callGetData(
            lat: '${value.latitude}',
            lon: '${value.longitude}',
            unit: 'metric');
        notifyListeners();
      } else {
        _currentLocation = Position(
          accuracy: 5.0,
          heading: -1.0,
          altitude: 0.0,
          latitude: 37.785834,
          longitude: -122.406417,
          speed: -1.0,
          speedAccuracy: -1.0,
        );
        callGetData(
            lat: '${_currentLocation.latitude}',
            lon: '${_currentLocation.longitude}',
            unit: 'metric');

        notifyListeners();
      }
    });
  }

  void getLocationDetails(Position position) {
    _locationService.getAddressFromLatLng(position).then((value) {
      _place = value;

      notifyListeners();
    });
  }

  void callGetData({String lon, String lat, String unit}) async {
    //metric == celcius
    //imperial == farenheit
    Dio dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.options.contentType = URLs.contenType;
    dio.options.receiveTimeout = 30000;
    var response = await ApiService(dio, baseUrl: URLs.baseURL).getDatabyCoord(
        lat: "${lat}", lon: "${lon}", apiKey: URLs.apikey, unit: unit);
    if (response != null) {
      _dataResponseModel = response;
      Position position = Position(
          longitude: response.lon,
          latitude: response.lat,
          accuracy: _currentLocation.accuracy,
          altitude: _currentLocation.altitude,
          speed: _currentLocation.speed,
          speedAccuracy: _currentLocation.speedAccuracy);
      getLocationDetails(position);

      _isLoading = false;
      notifyListeners();
    } else {
      setError();
    }
  }

  void setError() {
    _isLoading = false;
    _showError = !_showError;
    notifyListeners();
  }

  void searchLocation(String location) async {
    Dio dio = Dio();
    dio.options.receiveTimeout = 30000;
    dio.options.connectTimeout = 30000;
    dio.options.contentType = URLs.contenType;

    var respnse = await ApiService(dio, baseUrl: URLs.searchBaseURL)
        .searchLocation(location: location);

    if (respnse != null) {
      _searchList = respnse.searchResults;
      notifyListeners();
    }
  }

  Position get currentPosition => _currentLocation;
  Placemark get currentPlace => _place;
  List<SearchResult> get searchList => _searchList;
  DataResponseModel get weatherData => _dataResponseModel;
}
