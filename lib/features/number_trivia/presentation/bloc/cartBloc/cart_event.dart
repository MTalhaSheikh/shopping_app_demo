part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}


class AddToCartEvent extends CartEvent{
  cartModell cartModel;
  AddToCartEvent({required this.cartModel});
}

class RemoveFromCartEvent extends CartEvent{

  String id;
  RemoveFromCartEvent({required this.id});

}

class GetCartDataList extends CartEvent{


}