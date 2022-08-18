import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiServices {
  // get api
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final Response respose =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(respose);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // post api
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final Response respose = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(respose);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


// return Response 
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        }
      case 400:
        return BadRequestException("Bad request Exception");
      default:
        throw FetchDataException(
            "Error while commucating with server with status code ${response.statusCode}");
    }
  }
}
