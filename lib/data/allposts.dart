class allposts {
  late String who_posted;
  late String when_posted;
  late String what_posted;
  late String caption_post;
  late List who_liked;
  late String who_posted_url;

  // late List who_commented;
  allposts(
      {required String who_posted,
      required String when_posted,
      required String caption_post,
      required String what_posted,
      required List who_liked,
      required who_posted_url}) {
    this.who_posted = who_posted;
    this.when_posted = when_posted;
    this.what_posted = what_posted;
    this.who_liked = who_liked;
    this.caption_post = caption_post;
    this.who_posted_url = who_posted_url;
  }
}
