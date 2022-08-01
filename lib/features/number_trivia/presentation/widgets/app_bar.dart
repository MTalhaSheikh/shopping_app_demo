import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/navigations/locator.dart';
import '../../../../core/navigations/navigator_services.dart';
import '../../data/data_sources/local_data/commen/constants.dart';
import '../appearance/appearance_provider.dart';
import '../bloc/cartBloc/cart_bloc.dart';
import '../pages/selected_cart_items_page.dart';

class WidgetAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final double? height;
  final bool? showLeading;

  const WidgetAppBar({
    this.title = '',
    this.height = kToolbarHeight,
    this.showLeading = false,
  });

  @override
  State<WidgetAppBar> createState() => _WidgetAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height!);
}

class _WidgetAppBarState extends State<WidgetAppBar> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final appearance = AppearanceProvider.of(context);
    final cartProvider = BlocProvider.of<CartBloc>(context);

    return AppBar(
      backgroundColor: Constants.appBarColor,
      elevation: 1.0,
      title: Text(
        widget.title!,
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: Colors.black87,
        ),
      ),
      leading: widget.showLeading!
          ? BackButton(
              color: Colors.black,
              onPressed: widget.title == 'Cart'
                  ? () {
                      Navigator.pop(context);
                    }
                  : () {
                      Map<String, dynamic> data = {"data": {}};
                      _navigationService.navigateTo(
                          Constants.dashboardScreen, data);
                    },
            )
          : Container(),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: widget.title == 'Cart' ? (){} : () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectedCartItemPage()));
            // Navigator.pushNamed(context, Constants.selectedCartItemPage);
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                BlocConsumer<CartBloc, CartState>(listener: (context, state) {
              if (state is CartDataLoadedState) {
                print(state.cartModelList.toString());
              }
            }, builder: (context, state) {
              return Stack(
                children: [
                  const SizedBox(
                    width: 42,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Visibility(
                    visible: cartProvider.cartList.isNotEmpty ? true : false,
                    // visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: appearance.boldRedColor,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: cartProvider.cartList.isNotEmpty ? true : false,
                    // visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "${cartProvider.cartList.length}",
                        // "5",
                        style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
