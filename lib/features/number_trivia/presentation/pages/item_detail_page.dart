import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/cart_model.dart';
import '../appearance/appearance_provider.dart';
import '../bloc/cartBloc/cart_bloc.dart';
import '../bloc/counter/counter_bloc.dart';
import '../widgets/add_remove_button.dart';
import '../widgets/app_bar.dart';
import '../widgets/divider.dart';

class ItemDetailPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  bool isFav;
  final Function onTap;

  ItemDetailPage(this.name, this.img, this.price, this.isFav, this.onTap,
      {Key? key})
      : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  TextEditingController nutritionalTextController = TextEditingController();
  int _count = 1;

  @override
  void initState() {
    nutritionalTextController.text = "Nutritional values per 100g";
    BlocProvider.of<CartBloc>(context).add(GetCartDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final appearance = AppearanceProvider.of(context);
    final counterProvider = BlocProvider.of<CounterBloc>(context);
    final cartProvider = BlocProvider.of<CartBloc>(context);

    return Scaffold(
        appBar: WidgetAppBar(
          title: widget.name,
          showLeading: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Image.asset(
                    widget.img,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            widget.isFav = !widget.isFav;
                          });
                          widget.onTap();
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 35,
                          color: widget.isFav == true
                              ? appearance.boldRedColor
                              : Colors.grey,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: appearance.heading1TextStyle),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<CounterBloc, CounterState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Row(
                          children: [
                            Text("\$${widget.price}",
                                style: appearance.heading2TextStyle),
                            const Spacer(),
                            addRemoveButton(
                              const Icon(Icons.remove, size: 22),
                              () {
                                if (state.counter > 1) {
                                  _count = _count - 1;
                                  counterProvider.add(DecrementEvent());
                                }
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(state.counter.toString(),
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.black87,
                                  )),
                            ),
                            addRemoveButton(
                              const Icon(Icons.add, size: 22),
                              () {
                                _count = _count + 1;
                                counterProvider.add(IncrementEvent());
                              },
                            ),
                          ],
                        );
                      }),
                  divider(),
                  Text("Lecker",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black54,
                      )),
                  divider(),
                  Container(
                    width: size.width,
                    height: size.height * 0.09,
                    decoration: appearance.dropDownDecoration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: DropdownButton<String>(
                          value: nutritionalTextController.text,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black26,
                            size: 30,
                          ),
                          elevation: 16,
                          menuMaxHeight: size.height * 0.35,
                          dropdownColor: Colors.white,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                            color: Colors.black45,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              nutritionalTextController.text = newValue!;
                            });
                          },
                          underline: const SizedBox(),
                          items: [
                            "Nutritional values per 100g",
                            "Nutritional values per 200g",
                            "Nutritional values per 300g"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartDataLoadedState) {
                          return SizedBox(
                              width: size.width,
                              height: 60,
                              child: Visibility(
                                visible: state.cartModelList.any((element) =>
                                        element.name == widget.name)
                                    ? false
                                    : true,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: appearance.boldRedColor,
                                      onPrimary: Colors.white,
                                      textStyle: GoogleFonts.lato(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 15.0,
                                    ),
                                    onPressed: () {
                                      cartProvider.add(AddToCartEvent(
                                          cartModel: cartModell(
                                              name: widget.name,
                                              image: widget.img,
                                              price: widget.price)));
                                    },
                                    child: const Text("Add to the card")),
                              ));
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
