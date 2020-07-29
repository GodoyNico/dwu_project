abstract class MockData {
  static UserLog logedUser;

  static List<UserLog> users = [UserLog(username: 'DWU', password: 'DWU')];
}

class UserLog {
  String username;
  String password;
  UserLog({
    this.username,
    this.password,
  });
}
