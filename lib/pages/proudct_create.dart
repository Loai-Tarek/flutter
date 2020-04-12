import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProudctCreatePage extends StatefulWidget {
  final Function addProudct;

  ProudctCreatePage(this.addProudct);

  @override
  State<StatefulWidget> createState() {
    return _ProudctCreatePageState();
  }
}

class _ProudctCreatePageState extends State<ProudctCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;


  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Proudct Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Proudct Description'),
      maxLines: 4,
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic>proudct = {
      'title': _titleValue,
      'Descrioition': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProudct(proudct);
    Navigator.pushReplacementNamed(context, '/proudcts');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Save'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: _submitForm,
          )
        ],
      ),
    );
  }
}
