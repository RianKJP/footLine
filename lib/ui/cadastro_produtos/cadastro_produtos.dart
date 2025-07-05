import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/widget/top_bar.dart';

class CadastroProdutos extends StatefulWidget{
  const CadastroProdutos({super.key});

  @override
  State<StatefulWidget> createState() => _CadastroProdutosState();
}

class _CadastroProdutosState extends State<CadastroProdutos>{
  
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

          GestureDetector(

            onTap: () => {

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
              child: Center(
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
              ),
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
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
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
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
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
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
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "R\$",
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
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}