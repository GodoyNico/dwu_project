/* TextFormField(
                decoration: InputDecoration(
                  labelText: 'e-mail',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                ),
                controller: _emailController,
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'password',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                ),
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(
                height: 8,
              ),
              OutlineButton(
                onPressed: _sigin,
                child: Text('Sign in'),
              ), */

/* import 'package:dwu_project/db/mock_data.dart';

class LoginService {
  Future<bool> signIn({String username, String password, String email}) async {
    MockData.logedUser = null;
    await Future.delayed(Duration(milliseconds: 500), () {
      MockData.logedUser = MockData.users.firstWhere(
          (e) => e.email == username && e.password == password,
          orElse: () => null);
    });
    return MockData.logedUser != null;
  }

  Future<void> signOut() async {
    await Future.delayed(
        Duration(milliseconds: 500), () => MockData.logedUser = null);
  }
} */

/* import 'package:call_1807/models/car.dart';
import 'package:call_1807/models/user.dart';

abstract class MockData {
  static User logedUser;

  static List<User> users = [
    User(
        email: 'evandrofuhr@gmail.com',
        name: 'Evandro Führ',
        password: '123456'),
    User(email: 'edson@gmail.com', name: 'Edson Martins', password: '123456'),
    User(email: 'marcelo@gmail.com', name: 'Marcelo ', password: '123456'),
    User(email: '', name: 'Edson Martins', password: ''),
  ]; */

/* import 'package:dwu_project/services/login_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<ScaffoldState>();
  //final _loginService = LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _sigin() async {
    var _isValid = await _loginService.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (_isValid) {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } else {
      _key.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'E-mail ou Senha inválidos',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FadeInImage(
                    placeholder: AssetImage('assets\dwu.png'),
                    image: null,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                ),
                controller: _emailController,
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                ),
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(
                height: 8,
              ),
              OutlineButton(
                onPressed: _sigin,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */
