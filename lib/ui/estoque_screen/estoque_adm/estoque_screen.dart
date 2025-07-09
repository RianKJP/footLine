import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/nav_bar_config.dart';
import 'package:footline/ui/widget/top_bar.dart';
import 'package:footline/ui/product_screen/product_screen.dart';

class Product{
  String image;
  String name;
  String description;
  double price;
  String category;
  int stock;

  Product(this.image, this.name, this.description, this.price, this.category, this.stock);
}

class EstoqueScreen extends StatefulWidget {
  const EstoqueScreen({super.key});

  @override
  State<EstoqueScreen> createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {

  final TextEditingController controllerSearch = TextEditingController();
  List<Product> listProducts = [
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", "Descrição Ficticia", 479.90, "Corrida", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", "Descrição Ficticia", 479.90, "Corrida", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", "Descrição Ficticia", 479.90, "Corrida", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", "Descrição Ficticia", 479.90, "Corrida", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", "Descrição Ficticia", 479.90, "Corrida", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", "Descrição Ficticia", 479.90, "Corrida", 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.azulEscuro,
        foregroundColor: AppColors.branco,
        elevation: 6,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBarConfig(initialIndex: 5,isVendedor: false,))
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 8),

            child: SizedBox(
              width: 350,
              child: TextField(
                controller: controllerSearch,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Digite o nome do produto",
                  prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.azulEscuro,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18)
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 2),
                ),
              ),
            ),
          ),

          Container(
            width: 350,
            alignment: Alignment.center,
            child: Text(
              "Lista de Produtos",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.azulEscuro,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: listProducts.length,
              itemBuilder: (context, index) {
                final product = listProducts[index];
                return Align(
                  alignment: Alignment.center, // centraliza horizontalmente
                  child: SizedBox(
                    width: 350,  // largura fixa desejada
                    child: Container(
                      height: 180,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.azulEscuro,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 8,
                            offset: Offset(0, 5)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: double.infinity,
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8), 
                                decoration: BoxDecoration(
                                  color: AppColors.cinzaClaro,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.azulEscuro,
                                      ),
                                    ),
                                    Text(
                                      "R\$ ${product.price.toString()}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.laranja, 
                                      ),
                                    ),
                                    Text(
                                      "Estoque: ${product.stock.toString()}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.azulEscuro
                                      ),
                                    ),
                                    Text(
                                      "Categoria: ${product.category}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.azulEscuro
                                      ),
                                    ),
                                    const SizedBox(height:5),
                                    Align(
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors.laranja,
                                          foregroundColor: AppColors.azulEscuro,
                                          minimumSize: Size(155, 40),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ProductScreen()),
                                          );
                                        },
                                        child: Text("Mais Detalhes"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}