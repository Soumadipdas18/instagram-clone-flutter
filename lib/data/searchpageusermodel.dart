class SearchPageUserModel {
  late String username;
  late String fullname;
  late String photoURL;
  late String bio;
  late String uid;
  SearchPageUserModel(
      {required String username,
        required String fullname,
        required String photoURL,
        required String bio,
        required String uid
      }) {
    this.username = username;
    this.fullname = fullname;
    this.photoURL = photoURL;
    this.bio = bio;
    this.uid= uid;
  }
}
