/// author : "Kris Holt"
/// title : "watchOS 10 has arrived, bringing widgets back to the Apple Watch"
/// description : "It's a big day for Apple users as the company is rolling out major operating system updates for most of its devices (Mac users need to wait a bit longer). Just ahead of the Apple Watch Series 9 and Apple Watch Ultra 2 arriving later this week, the company has…"
/// url : "https://www.engadget.com/watchos-10-has-arrived-bringing-widgets-back-to-the-apple-watch-171753537.html"
/// urlToImage : "https://s.yimg.com/ny/api/res/1.2/1HLemmF7N.697ufEdQ_JBg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02OTc-/https://s.yimg.com/os/creatr-uploaded-images/2023-06/413ea3e0-03cc-11ee-9fd3-4f5e9da21729"
/// publishedAt : "2023-09-18T17:17:53Z"
/// content : "It's a big day for Apple users as the company is rolling out major operating system updates for most of its devices (Mac users need to wait a bit longer). Just ahead of the Apple Watch Series 9 and A… [+1461 chars]"

class PopularArticleEntity {
  PopularArticleEntity({
      String? author, 
      String? title, 
      String? description, 
      String? url, 
      String? urlToImage, 
      String? publishedAt, 
      String? content,}){
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  PopularArticleEntity.fromJson(dynamic json) {
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }

}