import 'package:flutter/material.dart';
import 'package:footline/modules/permission_panel/painel_permissao.dart';
import 'package:footline/modules/profile/seller/profile_screen.dart';
import 'package:footline/modules/profile/manager/profile_screen.dart';
import 'package:footline/modules/product/register_screen.dart';
import 'package:footline/modules/stock/manager/stock_screen.dart';
import 'package:footline/modules/stock/seller/stock_screen.dart';
import 'package:footline/modules/product/product_screen.dart';
import 'package:footline/modules/home/manager/home_adm.dart';
import 'package:footline/modules/home/seller/home_vendedor.dart';
import 'package:footline/modules/reports/performance_reports.dart';
import 'package:footline/core/widgets/navigation/nav_bar_bottom.dart';

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
    ProductScreen(),
  ];

   final List<Widget> _pagesVendedor = const [
    HomeVendedor(),
    EstoqueScreenVD(),
    PerfilScreenVendedor(),
    ProductScreen(),
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
