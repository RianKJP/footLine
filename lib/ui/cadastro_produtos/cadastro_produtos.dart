import 'package:flutter/material.dart';
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
      body: Text("Mané"),
    );
  }
}