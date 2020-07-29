import 'package:dwu_project/services/login_service.dart';
import 'package:dwu_project/utils/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<ScaffoldState>();
  final _loginService = LoginService();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signIn() async {
    var _isValid = await _loginService.signIn(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    if (_isValid) {
      Navigator.of(context).pushNamed(AppRotas.REGISTER_PAGE);
    } else {
      _key.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'Usuário ou senha inválidos',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onError,
                fontSize: 18,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Projeto DWU'),
      ), */
      key: _key,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: FlutterLogo(
                  size: 150,
                  colors: Colors.blue,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Usuário',
                  labelStyle: TextStyle(color: Colors.teal),
                  filled: true,
                ),
                controller: _usernameController,
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.teal),
                  filled: true,
                ),
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(width: 10),
              OutlineButton(
                onPressed: _signIn,
                borderSide: BorderSide(color: Colors.teal),
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.teal, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
