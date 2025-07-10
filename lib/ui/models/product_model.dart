class ProductModel {
  String image;
  String name;
  String? description;
  double price;
  String category;
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
        'category': category,
        'stock': stock,
      };
    }

    factory ProductModel.fromJson(Map<String, dynamic> json){
      return ProductModel(
        image: json['image'],
        name: json['name'],
        description: json['description'],
        price: (json['price'] as num).toDouble(),
        category: (json['category']).toString(),
        stock: json['stock'],
      );
    }
}