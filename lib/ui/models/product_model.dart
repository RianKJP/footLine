import 'package:footline/ui/models/category_model.dart';

class ProductModel {
  String image;
  String name;
  String? description;
  double price;
  CategoryModel category;
  int stock;

  ProductModel({
    required this.image, 
    required this.name, 
    this.description, 
    required this.price, 
    required this.category, 
    required this.stock
    });

    Map<String, dynamic> toJson(){
      return {
        'image': image,
        'name': name,
        'description': description,
        'price': price,
        'category': category.id,
        'stock': stock,
      };
    }

    factory ProductModel.fromJson(Map<String, dynamic> json){
      return ProductModel(
        image: json['image'],
        name: json['name'],
        description: json['description'],
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        category: CategoryModel.fromJson(json['category']),
        stock: json['stock'],
      );
    }
}