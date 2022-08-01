import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/data_sources/local_data/commen/constants.dart';
import '../bloc/cartBloc/cart_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/dashboard_card.dart';

class SelectedCartItemPage extends StatefulWidget {
  const SelectedCartItemPage({Key? key}) : super(key: key);

  @override
  _SelectedCartItemPageState createState() => _SelectedCartItemPageState();
}

class _SelectedCartItemPageState extends State<SelectedCartItemPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 70) / 2.8;
    final double itemWidth = size.width / 2;
    final cartProvider = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: const WidgetAppBar(
        title: 'Cart',
        showLeading: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartDataLoadedState) {
          return state.cartModelList.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: cartProvider.cartList.length,
                  itemBuilder: (context, index) {
                    var name = state.cartModelList[index].name.toString();
                    var img = state.cartModelList[index].image.toString();
                    var price = state.cartModelList[index].price.toString();
                    var isFav = false;
                    return DashboardCard(name, img, price, isFav, () async {
                      cartProvider.add(RemoveFromCartEvent(id: name));
                    }, "cart");
                  },
                )
              : const Center(child: Text("Please select the item first."));
        } else {
          return const Center(child: Text("Please select the item first."));
        }
      }),
    );
  }
}
