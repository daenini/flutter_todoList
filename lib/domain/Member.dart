class Member {
  late String _nickName; //닉네임
  late String _email; // 인증 이메일
  late String _password;

  Member(this._nickName, this._email, this._password);

  //getter
  String get  nickName => _nickName;
  String get email => _email;
  String get password => _password;

  @override
  String toString() {
    return 'Member{nickname: $nickName, email: $email, password: $password}';
  }
}