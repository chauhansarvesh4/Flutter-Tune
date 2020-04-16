class ItuneResponse {
  int _responseCode;
  ItuneModel _ituneModel;
  String _msg;


  int get responseCode => _responseCode;

  ItuneResponse(this._responseCode, this._ituneModel, this._msg);

  @override
  String toString() {
    return 'ItuneResponse{_responseCode: $_responseCode, _ituneModel: $_ituneModel, _msg: $_msg}';
  }

  ItuneModel get ituneModel => _ituneModel;

  String get msg => _msg;
}

class ItuneModel {
  Feed _feed;

  ItuneModel.fromJson(Map<String, dynamic> json) {
    _feed = Feed.fromJson(json['feed']);
  }

  Feed get feed => _feed;

  set feed(Feed value) {
    _feed = value;
  }

  @override
  String toString() {
    return 'ItuneModel{_feed: $_feed}';
  }
}

class Feed {
  String _title;
  String _id;
  String _copyright;
  String _icon;
  String _updated;
  List<Result> _results;

  Feed.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _title = json['id'];
    _title = json['copyright'];
    _title = json['icon'];
    _title = json['updated'];
    var list = json['results'] as List;
    _results = list?.map((e) => Result.fromJson(e)).toList();
  }

  List<Result> get results => _results;

  set results(List<Result> value) {
    _results = value;
  }

  String get updated => _updated;

  set updated(String value) {
    _updated = value;
  }

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }

  String get copyright => _copyright;

  set copyright(String value) {
    _copyright = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  @override
  String toString() {
    return 'Feed{_title: $_title, _id: $_id, _copyright: $_copyright, _icon: $_icon, _updated: $_updated, _results: $_results}';
  }
}

class Result {
  String _artistName;
  String _id;
  String _releaseDate;
  String _name;
  String _kind;
  String _copyright;
  String _artistId;
  String _artistUrl;
  String _artworkUrl100;
  List<Genre> _genres;
  String _url;

  Result.fromJson(Map<String, dynamic> json) {
    _artistName = json['artistName'];
    _id = json['id'];
    _releaseDate = json['releaseDate'];
    _name = json['name'];
    _kind = json['kind'];
    _copyright = json['copyright'];
    _artistId = json['artistId'];
    _artistUrl = json['artistUrl'];
    _artworkUrl100 = json['artworkUrl100'];
    var list = json['genres'] as List;
    _genres = list?.map((e) => Genre.fromJson(e)).toList();
    _url = json['url'];
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  List<Genre> get genres => _genres;

  set genres(List<Genre> value) {
    _genres = value;
  }

  String get artworkUrl100 => _artworkUrl100;

  set artworkUrl100(String value) {
    _artworkUrl100 = value;
  }

  String get artistUrl => _artistUrl;

  set artistUrl(String value) {
    _artistUrl = value;
  }

  String get artistId => _artistId;

  set artistId(String value) {
    _artistId = value;
  }

  String get copyright => _copyright;

  set copyright(String value) {
    _copyright = value;
  }

  String get kind => _kind;

  set kind(String value) {
    _kind = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get releaseDate => _releaseDate;

  set releaseDate(String value) {
    _releaseDate = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get artistName => _artistName;

  set artistName(String value) {
    _artistName = value;
  }

  @override
  String toString() {
    return 'Result{_artistName: $_artistName, _id: $_id, _releaseDate: $_releaseDate, _name: $_name, _kind: $_kind, _copyright: $_copyright, _artistId: $_artistId, _artistUrl: $_artistUrl, _artworkUrl100: $_artworkUrl100, _genres: $_genres, _url: $_url}';
  }
}

class Genre {
  String _genreId;
  String _name;
  String _url;

  Genre.fromJson(Map<String, dynamic> json) {
    _genreId = json['genreId'];
    _name = json['name'];
    _url = json['url'];
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get genreId => _genreId;

  set genreId(String value) {
    _genreId = value;
  }

  @override
  String toString() {
    return 'Genre{_genreId: $_genreId, _name: $_name, _url: $_url}';
  }
}
