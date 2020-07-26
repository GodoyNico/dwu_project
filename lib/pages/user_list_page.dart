import 'package:dwu_project/db/data.dart';
import 'package:dwu_project/entities/user.dart';
import 'package:dwu_project/utils/app_routes.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPage createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  var users = userList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Usuários cadastrados'),
        //centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRotas.HOME_PAGE);
          },
        ),
      ),
      body: ListView(
        children: users.map((user) {
          return ListTile(
            leading: Icon(Icons.person),
            //TODO: Avatar variado conforme cadastro
            /* CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://gravatar.com/avatar/${(email ?? '').toMD5()}?d=robohash'),
            ), */
            title: Text(
                '${user.name} ${user.surname}, ${user.age}, ${user.gender}'),
            subtitle: Text(user.email),
            onTap: () {
              //TODO: Edição de usuário
            },
            onLongPress: () {
              setState(() {
                users.remove(user);
              });
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var user =
              await Navigator.of(context).pushNamed(AppRotas.REGISTER_PAGE);
          setState(() {
            users.add(user as User);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
