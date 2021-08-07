class SearchPageUserModel {
  late String username;
  late String fullname;
  late String photoURL;
  SearchPageUserModel(
      {required String username,
        required String fullname,
        required String photoURL,
      }) {
    this.username = username;
    this.fullname = fullname;
    this.photoURL = photoURL;
  }
}
