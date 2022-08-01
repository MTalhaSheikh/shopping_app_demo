part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartDataLoadedState extends CartState {
  final List<cartModell> cartModelList;

  CartDataLoadedState({required this.cartModelList});
}


