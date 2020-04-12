import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './proudct_create.dart';
import './proudct_list.dart';

class ProudctsAdminPage extends StatelessWidget {
  final Function addProudct;

  final Function deleteProudct;

  ProudctsAdminPage(this.addProudct, this.deleteProudct);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Proudct'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/proudcts');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: _buildSideDrawer(context),
          appBar: AppBar(
            title: Text('Manage proudcts'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create proudct',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Proudcts',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProudctCreatePage(addProudct),
              ProudctListPage()
            ],
          ),
        ));
  }
}
