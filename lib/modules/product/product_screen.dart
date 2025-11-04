import 'package:flutter/material.dart';
import 'package:footline/models/product_model.dart';
import 'package:footline/core/widgets/visual/top_bar.dart';
import 'package:footline/core/theme/app_colors.dart';

class ProductScreen extends StatefulWidget{
  final ProductModel? product;

  const ProductScreen({super.key, this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>{
  
  late double value;

  @override
  void initState() {
    super.initState();
    value = widget.product!.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.branco,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                        ),
                        Text(
                          "Detalhes do Produto",
                          style: TextStyle(
                            color: AppColors.azulEscuro,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),

              // Imagem com altura definida
              ClipRRect(
                child: Image.network(
                  widget.product!.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product!.name,

                      style: TextStyle(
                        color: AppColors.azulEscuro,
                        fontSize: 21
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    Text(
                      'Infos do Produto',
                      style: TextStyle(
                        color: AppColors.azulEscuro,
                        fontSize: 19.5,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 180,
                    child: _ResumoBox(title: "Preço", value: "${widget.product!.price}"),
                  ),
                  SizedBox(
                    width: 180,
                    child: _ResumoBox(title: "Estoque Atual", value: "${widget.product!.stock} unidades"),
                  ),
                ],
              ),

              SizedBox(
                height: 6,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 180,
                    child: _ResumoBox(title: "Categoria", value: "${widget.product!.category.name}"),
                  ),
                  SizedBox(
                    width: 180,
                    child: _ResumoBox(title: "Comissão", value: "R\$ ${(value * 0.20).toStringAsFixed(2)}"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResumoBox extends StatelessWidget {
  final String title;
  final String value;

  const _ResumoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.azulEscuro)),
        ],
      ),
    );
  }
}