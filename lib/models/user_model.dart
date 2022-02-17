class User {
  final String uid;
  final String? email;

  User(this.uid, this.email);
}

class Userprofile {
  final String? url;
  final String? name;
  final List<String> skills;

  Userprofile(this.url, this.name, this.skills);
}
