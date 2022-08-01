import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<cartModell> cartList=[];

  CartBloc() : super(CartInitial()) {

    on<AddToCartEvent>((event, emit) {
      cartList.add(event.cartModel);
      emit(CartDataLoadedState(cartModelList: cartList));
    });

    on<RemoveFromCartEvent>((event, emit) {
      cartList.removeWhere((x)=>x.name==event.id);
      emit(CartDataLoadedState(cartModelList: cartList));
    });

    on<GetCartDataList>((event, emit) {
      emit(CartDataLoadedState(cartModelList: cartList));
    });

  }
}
