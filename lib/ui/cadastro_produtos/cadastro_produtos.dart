import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/estoque_screen/estoque_adm/estoque_screen.dart';
import 'package:footline/ui/models/category_model.dart';
import 'package:footline/ui/models/product_model.dart';
import 'package:footline/ui/service/category_service.dart';
import 'package:footline/ui/service/product_service.dart';
import 'package:footline/ui/widget/top_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:footline/ui/widget/my_product.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:io';

class CadastroProdutos extends StatefulWidget{
  const CadastroProdutos({super.key});

  @override
  State<StatefulWidget> createState() => _CadastroProdutosState();
}

class _CadastroProdutosState extends State<CadastroProdutos>{
  File? _imageProduct;
  final MyProduct _myProduct = MyProduct();
  List<CategoryModel> categories = [];

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();
  String categoryController = ' ';

  void fetchCategories() async {
    final categories = await CategoryService.fetchCategories();

    setState(() {
      this.categories = categories;
    });
  }

  void _alterarImagem() async {
    final imageSelection = await _myProduct.selectionImage(source: ImageSource.gallery);
    if (imageSelection != null) {
      setState(() {
        _imageProduct = imageSelection;
      });
    }
  }

  void productCreateSucess(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Produto Cadastrado com Sucesso',
      confirmBtnText: 'Ok',
      confirmBtnColor: AppColors.azulEscuro,
    );
  }

  @override
  void initState(){
    super.initState();
    fetchCategories();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.branco,
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000), // sombra leve
                  offset: Offset(0, 4), // deslocamento da sombra (x, y)
                  blurRadius: 8, // "borrão" da sombra
                  spreadRadius: 1, // expansão da sombra
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                Text(
                  "Cadastrar Produto",
                  style: TextStyle(
                    color: AppColors.azulEscuro,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      _alterarImagem()
                    },

                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)
                        ),
                        color: AppColors.cinzaClaro,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 0.5,
                          )
                        ]
                      ),
                      child:_imageProduct == null ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              color: AppColors.azulEscuro,
                            ),

                            Text(
                              "Adicione uma imagem do produto",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.azulEscuro,
                              ),
                            ),
                          ],
                        ),
                      ) : ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        child: Image.file(
                          _imageProduct!,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: 329,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nome do Produto",
                          style: TextStyle(
                            color: AppColors.azulEscuro,
                            fontSize: 14,
                          ),
                        ),

                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Digite o nome do produto",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0x80000000),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0x1A000000),
                                width: 1,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x1A000000), width: 2), 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: 329,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Descrição",
                          style: TextStyle(
                            color: AppColors.azulEscuro,
                            fontSize: 14,
                          ),
                        ),

                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Digite a descrição do produto",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0x80000000),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0x1A000000),
                                width: 1,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x1A000000), width: 2), 
                            ),
                          ),
                        ),

                        Text(
                          "Máximo de 200 caracteres",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0x80000000)
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: 329,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Preço",
                          style: TextStyle(
                            color: AppColors.azulEscuro,
                            fontSize: 14,
                          ),
                        ),

                        TextField(
                          controller: priceController,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "R\$",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0x80000000),
                            ),
                            contentPadding: EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0x1A000000),
                                width: 1,
                              )
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x1A000000), width: 2), 
                            ),
                          ),
                        ),

                        Text(
                          "Informe o preço do produto",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0x80000000)
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: 329,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Estoque Disponível",
                          style: TextStyle(
                            color: AppColors.azulEscuro,
                            fontSize: 14,
                          ),
                        ),

                        TextField(
                          controller: stockController,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Quantidade em estoque",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0x80000000),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0x1A000000),
                                width: 1,
                              )
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x1A000000), width: 2), 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: 329,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categoria do Produto",
                          style: TextStyle(
                            color: AppColors.azulEscuro,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              final isSelected = category.id == categoryController;
                              return Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        categoryController = category.id;
                                      });
                                    },
                                    child: Text(
                                      category.name,

                                      style: TextStyle(
                                        color: AppColors.pretoEscuro
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide.none,
                                      backgroundColor: isSelected ? AppColors.laranja : AppColors.cinzaClaro,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)
                                      ),
                                      padding: EdgeInsets.all(6)
                                    ),
                                  ),

                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    height: 45,
                    width: 329,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.pretoEscuro,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        if (_imageProduct == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Selecione uma imagem antes de continuar.")),
                          );
                        }
                        final product = ProductModel(
                          image: _imageProduct!.path,
                          name: nameController.text,
                          description: descriptionController.text.isEmpty ? null : descriptionController.text,
                          price: double.tryParse(priceController.text) ?? 0.0,
                          category: categoryController.trim(),
                          stock: int.parse(stockController.text),
                        );
                        final response = await ProductService.createProduct(product);
                        if (response.statusCode == 201){
                          productCreateSucess(context);

                          await Future.delayed(Duration(seconds: 10));

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const EstoqueScreen()),
                          );
                        }
                      },
                      child: const Text(
                        "Cadastrar Produto",
                        style: TextStyle(
                          color: AppColors.branco,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}