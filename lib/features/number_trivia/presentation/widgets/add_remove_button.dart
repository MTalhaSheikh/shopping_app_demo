import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget addRemoveButton(Icon icon, Function onTapped){
  return Material(
    child: InkWell(
      onTap: (){
        onTapped();
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              // offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: icon,
      ),
    ),
  );
}