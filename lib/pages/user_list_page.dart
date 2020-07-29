import 'package:dwu_project/entities/user.dart';
import 'package:dwu_project/entities/user_repository.dart';
import 'package:dwu_project/utils/app_routes.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPage createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  var user = User;
  UserRepository _repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Usuários cadastrados'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRotas.HOME_PAGE);
          },
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: _repository.getUsers(),
        initialData: null,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.map((user) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(
                    '${user.name} ${user.surname}, ${user.age}, ${user.gender}'),
                subtitle: Text(user.email),
                onTap: () {},
                onLongPress: () {},
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var user =
              await Navigator.of(context).pushNamed(AppRotas.REGISTER_PAGE);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
