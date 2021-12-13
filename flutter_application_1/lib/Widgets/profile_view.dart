import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/users_provider.dart';
import 'package:provider/provider.dart' as provider;
import 'one_user.dart';


class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData =provider.Provider.of<UsersProvider>(context);
    final users = userData.usersList;

    return ListView.builder(

      itemCount: 1,
      itemBuilder: (ctx, i) => OneUser(users[0]),
      
    );
  }
}