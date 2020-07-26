import 'package:dwu_project/db/mock_data.dart';

class LoginService {
  Future<bool> signIn({String username, String password}) async {
    MockData.logedUser = null;
    await Future.delayed(Duration(milliseconds: 500), () {
      MockData.logedUser = MockData.users.firstWhere(
          (element) =>
              element.username == username && element.password == password,
          orElse: () => null);
    });
    return MockData.logedUser != null;
  }

  Future<void> signOut() async {
    await Future.delayed(
      Duration(milliseconds: 500),
      () => MockData.logedUser = null,
    );
  }
}
