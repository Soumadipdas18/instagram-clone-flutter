class allstories{
  late String who_posted;
  late String when_posted;
  late String what_posted;
  // late List who_commented;
  allstories( {required String who_posted, required String when_posted,required String what_posted}){
    this.who_posted=who_posted;
    this.when_posted=when_posted;
    this.what_posted=what_posted;
  }
}
List<allstories> stories=[
  allstories(who_posted: "Doge", when_posted: "1 day ago", what_posted: 'assets/posts/doge.jpg', ),
  allstories(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', ),
  allstories(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', ),
  allstories(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', ),
  allstories(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', ),
  allstories(who_posted: "Cheems", when_posted: "1 day ago", what_posted: 'assets/posts/cheems.png', ),
  allstories(who_posted: "Cat", when_posted: "1 day ago", what_posted: 'assets/posts/cat.jpg',),
  allstories(who_posted: "Pig", when_posted: "1 day ago", what_posted: 'assets/posts/pig.jpg',),
];