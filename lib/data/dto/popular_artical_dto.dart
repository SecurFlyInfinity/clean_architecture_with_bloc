/// status : "ok"
/// totalResults : 2437
/// articles : [{"source":{"id":"engadget","name":"Engadget"},"author":"Kris Holt","title":"watchOS 10 has arrived, bringing widgets back to the Apple Watch","description":"It's a big day for Apple users as the company is rolling out major operating system updates for most of its devices (Mac users need to wait a bit longer). Just ahead of the Apple Watch Series 9 and Apple Watch Ultra 2 arriving later this week, the company has…","url":"https://www.engadget.com/watchos-10-has-arrived-bringing-widgets-back-to-the-apple-watch-171753537.html","urlToImage":"https://s.yimg.com/ny/api/res/1.2/1HLemmF7N.697ufEdQ_JBg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02OTc-/https://s.yimg.com/os/creatr-uploaded-images/2023-06/413ea3e0-03cc-11ee-9fd3-4f5e9da21729","publishedAt":"2023-09-18T17:17:53Z","content":"It's a big day for Apple users as the company is rolling out major operating system updates for most of its devices (Mac users need to wait a bit longer). Just ahead of the Apple Watch Series 9 and A… [+1461 chars]"}]

class PopularArticalDto {
  PopularArticalDto({
      String? status, 
      num? totalResults, 
      List<Articles>? articles,}){
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
}

  PopularArticalDto.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalResults;
  List<Articles>? _articles;

  String? get status => _status;
  num? get totalResults => _totalResults;
  List<Articles>? get articles => _articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_articles != null) {
      map['articles'] = _articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"engadget","name":"Engadget"}
/// author : "Kris Holt"
/// title : "watchOS 10 has arrived, bringing widgets back to the Apple Watch"
/// description : "It's a big day for Apple users as the company is rolling out major operating system updates for most of its devices (Mac users need to wait a bit longer). Just ahead of the Apple Watch Series 9 and Apple Watch Ultra 2 arriving later this week, the company has…"
/// url : "https://www.engadget.com/watchos-10-has-arrived-bringing-widgets-back-to-the-apple-watch-171753537.html"
/// urlToImage : "https://s.yimg.com/ny/api/res/1.2/1HLemmF7N.697ufEdQ_JBg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02OTc-/https://s.yimg.com/os/creatr-uploaded-images/2023-06/413ea3e0-03cc-11ee-9fd3-4f5e9da21729"
/// publishedAt : "2023-09-18T17:17:53Z"
/// content : "It's a big day for Apple users as the company is rolling out major operating system updates for most of its devices (Mac users need to wait a bit longer). Just ahead of the Apple Watch Series 9 and A… [+1461 chars]"

class Articles {
  Articles({
      Source? source, 
      String? author, 
      String? title, 
      String? description, 
      String? url, 
      String? urlToImage, 
      String? publishedAt, 
      String? content,}){
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  Articles.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
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

/// id : "engadget"
/// name : "Engadget"

class Source {
  Source({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}