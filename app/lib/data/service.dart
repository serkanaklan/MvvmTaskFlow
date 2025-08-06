import 'dart:io';
import 'package:app/domain/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class Service1 with ChangeNotifier {
  late final dio = Dio(
    BaseOptions(
      headers: {'User-Agent': 'FlutterApp', 'Accept': 'application/json'},
    ),
  );
  List<Model1> data = [];
  bool isLoading = false;
  Future<void> fetchData() async {
    isLoading = true;
    const url = 'https://jsonplaceholder.typicode.com/comments/';
    final response = await dio.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data as List<dynamic>;
      data = responseData.map((e) => Model1.fromJson(e)).toList();
      debugPrint('Toplam veri: ${data.length}');
      debugPrint(response.data.toString());
    } else {
      throw Exception('${response.statusMessage} \n ${response.statusCode}');
    }
    isLoading = false;
    notifyListeners();
  }
}
