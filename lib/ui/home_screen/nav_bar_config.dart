import 'package:flutter/material.dart';
import 'package:footline/ui/Painel_Permiss%C3%A3o/painel_permissao.dart';
import 'package:footline/ui/Perfil/Pefil_vendedor/perfil_screen.dart';
import 'package:footline/ui/Perfil/Perfil_adm/perfil_screen.dart';
import 'package:footline/ui/cadastro_produtos/cadastro_produtos.dart';
import 'package:footline/ui/estoque_screen/estoque_adm/estoque_screen.dart';
import 'package:footline/ui/estoque_screen/estoque_vendedor/estoque_screen.dart';
import 'package:footline/ui/home_screen/home_adm/home_adm.dart';
import 'package:footline/ui/home_screen/home_vendedor/home_vendedor.dart';
import 'package:footline/ui/relatorio_Desempenho/relatorio_desempenho.dart';
import 'package:footline/ui/widget/nav_bar_bottom.dart';

class NavBarConfig extends StatefulWidget {
  final int initialIndex;
  final bool isVendedor;
  const NavBarConfig({super.key, this.initialIndex = 0,required this.isVendedor,});

  @override
  State<NavBarConfig> createState() => _NavBarConfigState();
}

class _NavBarConfigState extends State<NavBarConfig> {
  late int currentIndex;
  bool isTransitioning = false;

  final List<Widget> _pagesAdm = const [
    HomeAdm(),
    EstoqueScreen(),
    PerfilScreenADM(),
    PainelPermissaoScreen(),
    RelatorioLojaScreen(),
    CadastroProdutos(),
    PerfilScreenVendedor(),
    HomeVendedor()
  ];

   final List<Widget> _pagesVendedor = const [
    HomeVendedor(),
    EstoqueScreenVD(),
    PerfilScreenVendedor(),
  ];

 List<Widget> get _pages => widget.isVendedor ? _pagesVendedor : _pagesAdm;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex.clamp(0, _pages.length - 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isTransitioning
            ? Container() // ou um loader
            : _pages[currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: NavBarBottom(
          activeIndex: currentIndex,
          onTap: (index) async {
            if (index != currentIndex && !isTransitioning) {
              setState(() {
                isTransitioning = true;
              });

              await Future.delayed(const Duration(milliseconds: 300));

              setState(() {
                currentIndex = index.clamp(0, _pages.length - 1);
                isTransitioning = false;
              });
            }
          },
        ),
      ),
    );
  }
}
