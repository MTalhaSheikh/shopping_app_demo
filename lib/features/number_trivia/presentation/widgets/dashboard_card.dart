import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localstorage/localstorage.dart';

import '../../data/data_sources/local_data/commen/constants.dart';
import '../appearance/appearance_provider.dart';

class DashboardCard extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String cardType;
  bool isfav;
  Function onPres;

  DashboardCard(
      this.name, this.img, this.price, this.isfav, this.onPres, this.cardType,
      {Key? key})
      : super(key: key);

  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  // final LocalStorage storage = LocalStorage('fav');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final appearance = AppearanceProvider.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ).scale(1)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.16,
                width: size.width / 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      widget.img,
                      fit: BoxFit.cover,
                    )),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                         widget.onPres();
                      },
                      child: Icon(
                        widget.cardType == "cart" ? Icons.remove_circle: Icons.favorite,
                        size: 25,
                        color: widget.cardType == "cart" ? Colors.red : widget.isfav
                            ? appearance.boldRedColor
                            : Colors.grey,
                      ),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.name,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w800, fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text("\$${widget.price}",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
