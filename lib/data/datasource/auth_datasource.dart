import 'package:dartz/dartz.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http.post(
      Uri.parse("https://api.escuelajs.co/api/v1/users/"),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return right(RegisterResponseModel.fromJson(response.body));
    } else {
      return left("Register Gagal");
    }
  }
}
