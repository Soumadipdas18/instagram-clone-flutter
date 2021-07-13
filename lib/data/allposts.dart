class allposts{
  late String who_posted;
  late String when_posted;
  late String what_posted;
  late String caption_post;
  late List who_liked;
  // late List who_commented;
  allposts( {required String who_posted, required String when_posted, required String caption_post,required String what_posted,required List who_liked}){
    this.who_posted=who_posted;
    this.when_posted=when_posted;
    this.what_posted=what_posted;
    this.who_liked=who_liked;
    this.caption_post=caption_post;
  }
}
List<allposts> posts=[
  allposts(who_posted: "Doge", when_posted: "1 day ago", what_posted: 'assets/posts/doge.jpg', caption_post: 'A beutiful doge', who_liked:  ['a','b','c','d','e']),
  allposts(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', caption_post: 'A beutiful cheems', who_liked:  ['a','b','c','d']),
  allposts(who_posted: "Cat", when_posted: "1 day ago", what_posted: 'assets/posts/cat.jpg', caption_post: 'A beutiful cat', who_liked:  ['a','b','c']),
  allposts(who_posted: "Doge", when_posted: "1 day ago", what_posted: 'assets/posts/doge.jpg', caption_post: 'A beutiful doge', who_liked:  ['a','b','c','d','e']),
  allposts(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', caption_post: 'A beutiful cheems', who_liked:  ['a','b','c','d']),
  allposts(who_posted: "Cat", when_posted: "1 day ago", what_posted: 'assets/posts/cat.jpg', caption_post: 'A beutiful cat', who_liked:  ['a','b','c']),
  allposts(who_posted: "Pig", when_posted: "1 day ago", what_posted: 'assets/posts/pig.jpg',  caption_post: 'A beutiful pig',who_liked: ['a','b','c']),
  allposts(who_posted: "Doge", when_posted: "1 day ago", what_posted: 'assets/posts/doge.jpg', caption_post: 'A beutiful doge', who_liked:  ['a','b','c','d','e']),
  allposts(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', caption_post: 'A beutiful cheems', who_liked:  ['a','b','c','d']),
  allposts(who_posted: "Cat", when_posted: "1 day ago", what_posted: 'assets/posts/cat.jpg', caption_post: 'A beutiful cat', who_liked:  ['a','b','c']),
  allposts(who_posted: "Pig", when_posted: "1 day ago", what_posted: 'assets/posts/pig.jpg',  caption_post: 'A beutiful pig',who_liked: ['a','b','c']),
  allposts(who_posted: "Doge", when_posted: "1 day ago", what_posted: 'assets/posts/doge.jpg', caption_post: 'A beutiful doge', who_liked:  ['a','b','c','d','e']),
  allposts(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', caption_post: 'A beutiful cheems', who_liked:  ['a','b','c','d']),
  allposts(who_posted: "Cat", when_posted: "1 day ago", what_posted: 'assets/posts/cat.jpg', caption_post: 'A beutiful cat', who_liked:  ['a','b','c']),
  allposts(who_posted: "Pig", when_posted: "1 day ago", what_posted: 'assets/posts/pig.jpg',  caption_post: 'A beutiful pig',who_liked: ['a','b','c']),
  allposts(who_posted: "Pig", when_posted: "1 day ago", what_posted: 'assets/posts/pig.jpg',  caption_post: 'A beutiful pig',who_liked: ['a','b','c']),
];