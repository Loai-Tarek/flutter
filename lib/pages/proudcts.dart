import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/proudcts/proudcts.dart';

class ProudctsPage extends StatelessWidget {
  final List<Map<String, dynamic>> proudcts;

  ProudctsPage(this.proudcts);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Proudct'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: () {})
        ],
      ),
      body: Proudcts(proudcts),
    );
  }
}
