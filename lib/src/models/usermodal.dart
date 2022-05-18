class UserModal {
  String? name, email, userName;
  UserModal(this.name, this.email, this.userName);
  UserModal.fromJson(parsedData) {
    name = parsedData['name'];
    email = parsedData['email'];
    userName = parsedData['username'];
  }
}
