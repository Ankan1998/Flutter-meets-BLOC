class Moviemodel {
  String id;
  String title;
  String year;
  String length;
  String rating;
  String ratingVotes;
  String poster;
  String plot;
  Trailer trailer;
  List<Cast> cast;

  Moviemodel(
      {this.id,
        this.title,
        this.year,
        this.length,
        this.rating,
        this.ratingVotes,
        this.poster,
        this.plot,
        this.trailer,
        this.cast});

  Moviemodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    length = json['length'];
    rating = json['rating'];
    ratingVotes = json['rating_votes'];
    poster = json['poster'];
    plot = json['plot'];
    trailer =
    json['trailer'] != null ? new Trailer.fromJson(json['trailer']) : null;
    if (json['cast'] != null) {
      // ignore: deprecated_member_use
      cast = new List<Cast>();
      json['cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['length'] = this.length;
    data['rating'] = this.rating;
    data['rating_votes'] = this.ratingVotes;
    data['poster'] = this.poster;
    data['plot'] = this.plot;
    if (this.trailer != null) {
      data['trailer'] = this.trailer.toJson();
    }
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trailer {
  String id;
  String link;

  Trailer({this.id, this.link});

  Trailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    return data;
  }
}

class Cast {
  String actor;
  String actorId;
  String character;

  Cast({this.actor, this.actorId, this.character});

  Cast.fromJson(Map<String, dynamic> json) {
    actor = json['actor'];
    actorId = json['actor_id'];
    character = json['character'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actor'] = this.actor;
    data['actor_id'] = this.actorId;
    data['character'] = this.character;
    return data;
  }
}