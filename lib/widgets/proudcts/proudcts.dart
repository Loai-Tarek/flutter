import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './proudct_card.dart';
class Proudcts extends StatelessWidget {
  final List<Map<String, dynamic>> proudcts;

  Proudcts(this.proudcts) {
    print('[Proudcts Widget] Constructor');
  }


  Widget _buildProudctList() {
    Widget productCards;
    if (proudcts.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context , int index) => ProudctCard(proudcts[index] , index),
        itemCount: proudcts.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Proudcts Widget] build()');
    return _buildProudctList();
  }
}
