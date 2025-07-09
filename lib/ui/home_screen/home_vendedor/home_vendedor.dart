import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/widget/top_bar.dart';


class Product{
  String image;
  String name;
  int stock;

  Product(this.image, this.name, this.stock);
}

class HomeVendedor extends StatefulWidget {
  const HomeVendedor({super.key});

  @override
  State<HomeVendedor> createState() => _HomeVendedorState();
}

class _HomeVendedorState extends State<HomeVendedor> {

  List<Product> listProducts = [
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", 5),
    Product("assets/img/Adidas tenis 2.webp", "Adidas Ultraboost", 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, color: AppColors.azulEscuro),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        "Olá, Nome!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.azulEscuro,
                        ),
                      ),
                      Text(
                        "Vendas do Mês: 0",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.azulEscuro,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Image.asset('banner ajustado.png')
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Text('Produtos mais vendidos'),
                      Row(
                        children: [
                        ListView.builder(
                          itemCount: listProducts.length,
                          itemBuilder: (context, index) {
                            final product = listProducts[index];
                            return Align(
                              alignment: Alignment.center, // centraliza horizontalmente
                              child: SizedBox(
                                width: 350,  // largura fixa desejada
                                child: Container(
                                  height: 160,
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
                                                  "Estoque: ${product.stock.toString()}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.azulEscuro
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
                      ],
                    ),
                      Text('Produtos com maior comissão'),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}