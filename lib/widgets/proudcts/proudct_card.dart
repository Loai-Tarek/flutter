import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './price._tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProudctCard extends StatelessWidget {
  final Map<String, dynamic> proudct;
  final int proudctIndex;

  ProudctCard(this.proudct, this.proudctIndex);

  Widget _buildTitlePriceRow() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(proudct['title']),
            SizedBox(
              width: 8.0,
            ),
            PriceTag(proudct['price'].toString()),
          ],
        ));
  }
  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/proudct/' + proudctIndex.toString()),
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/proudct/' + proudctIndex.toString()),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
          Image.asset(proudct['image']),
          _buildTitlePriceRow(),
          AddressTag('Union Square, San Francisco'),
          _buildActionButtons(context),
      ],
    ));
  }
}
