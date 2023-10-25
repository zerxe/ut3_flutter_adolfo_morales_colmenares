import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';
import 'tabs/tab_0_main.dart';
import 'tabs/tab_1_list_character.dart';
import 'tabs/tab_2_data_character.dart';

class FlutTab extends StatelessWidget {
  const FlutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final username = userProvider.user?.username ?? '';

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(username),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Principal'),
              Tab(text: 'Fichas'),
              Tab(text: 'Datos Ficha'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
      ),
    );
  }
}
