import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:footline/models/category_model.dart';

class CategoryService {

  static Future<List<CategoryModel>> fetchCategories() async {

    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/categorias/'));

    if (response.statusCode == 200){
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception("Erro ao buscar categorias");
    }
  }
}