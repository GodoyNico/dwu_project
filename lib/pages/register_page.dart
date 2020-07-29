import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:dwu_project/entities/user.dart';
import 'package:dwu_project/entities/user_repository.dart';
import 'package:dwu_project/utils/app_routes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();
  User _user = User();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();
  final _genderController = TextEditingController();
  bool _controller = false;
  UserRepository repository() => UserRepository();
  UserRepository _userRepository;
  //String dropdownValue = 'Escolher';

  @override
  void dispose() {
    super.dispose();
    _userRepository = UserRepository();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Cadastro de Usuário'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRotas.HOME_PAGE);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if (value.length == 0) return 'Campo obrigatório';
                        if (value.length > 30) return 'O nome é muito longo';
                        return null;
                      },
                      onSaved: (newLog) {
                        _user.name = newLog;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller: _surnameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Sobrenome',
                      ),
                      validator: (value) {
                        if (value.length == 0) return 'Campo obrigatório';
                        if (value.length > 30)
                          return 'O sobrenome é muito longo';
                        return null;
                      },
                      onSaved: (newLog) {
                        _user.surname = newLog;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(color: Colors.teal),
                  labelText: 'Email',
                ),
                validator: (email) {
                  if (!EmailValidator.validate(email)) return 'Email inválido';
                  return null;
                },
                controller: _emailController,
                onSaved: (email) {
                  _user.email = email;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Idade',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if ((int.tryParse(value) ?? 0) <= 0)
                          return 'Campo obrigatório';
                        return null;
                      },
                      onSaved: (newLog) {
                        _user.age = int.tryParse(newLog);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      controller: _salaryController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        RealInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        labelStyle: TextStyle(color: Colors.teal),
                        labelText: 'Salário',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.length >= 10) return 'Salário muito grande';
                        return null;
                      },
                      onSaved: (newLog) {
                        _user.salary = newLog as double;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  DropdownButtonFormField<String>(
                    value: null,
                    style: TextStyle(color: Colors.teal),
                    isExpanded: true,
                    onChanged: (String newValue) {
                      print(newValue);
                    },
                    onSaved: (valor) {
                      _user.gender = valor;
                    },
                    validator: (v) {},
                    items: [
                      DropdownMenuItem<String>(
                        value: null,
                        child: Text('Escolher'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'F',
                        child: Text('Feminino'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'M',
                        child: Text('Masculino'),
                      )
                    ],
                  )
                ],
              ),
              Container(
                width: double.maxFinite,
                child: OutlineButton(
                  onPressed: () {
                    saveUser();
                    if (_controller) {
                      Navigator.of(context)
                          .pushNamed(AppRotas.REGISTER_LIST_PAGE);
                    }
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.teal,
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppRotas.REGISTER_LIST_PAGE);
                  },
                  child: Text(
                    'Usuários cadastrados',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.teal,
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(String resposta) {
    if (!_form.currentState.validate()) {
      _controller = false;
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
              duration: Duration(milliseconds: 2500),
              content: Text(
                'Dados inválidos',
                style: TextStyle(fontSize: 18),
              ),
              backgroundColor: Colors.red),
        );
      return;
    }
    _controller = true;
  }

  void saveUser() async {
    if (!_form.currentState.validate()) {
      showSnackBar('Dados inválidos');
      return;
    }
    _form.currentState.save();

    //_controller = await repository.newUser(_user);
  }
}
