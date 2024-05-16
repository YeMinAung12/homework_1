import 'package:dio/dio.dart';
import 'package:flutter_homework_1/model/login_model.dart';
import 'package:flutter_homework_1/model/product_model.dart';
import 'package:flutter_homework_1/ulti/my_share.dart';

Dio dio = Dio()
  ..options.baseUrl = 'https://dummyjson.com/'
  ..options.connectTimeout = Duration(seconds: 5)
  ..options.receiveTimeout = Duration(seconds: 3);

Future<Product?> getAllProduct() async {
  try {
    var response = await dio.get(
      'auth/products',
      // queryParameters: {'skip': skip},
    );
    return Product.fromJson(response.data);
  } on DioException {
    return null;
  }
}

Future<Login?> login(String userName, String password) async {
  try {
    var response = await dio
        .post('auth/login', data: {'username': userName, 'password': password});
    var result = Login.fromJson(response.data);
    dio.options.headers = {'Authorization': result.token};
    return result;
  } on DioException {
    return null;
  }
}
