class SearchModel {
  List<Titles> titles;
  List<Names> names;
  List<Companies> companies;

  SearchModel({this.titles, this.names, this.companies});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['titles'] != null) {
      // ignore: deprecated_member_use
      titles = new List<Titles>();
      json['titles'].forEach((v) {
        titles.add(new Titles.fromJson(v));
      });
    }
    if (json['names'] != null) {
      // ignore: deprecated_member_use
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      // ignore: deprecated_member_use
      companies = new List<Companies>();
      json['companies'].forEach((v) {
        companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.titles != null) {
      data['titles'] = this.titles.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Titles {
  String title;
  String image;
  String id;

  Titles({this.title, this.image, this.id});

  Titles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}

class Names {
  String title;
  String image;
  String id;

  Names({this.title, this.image, this.id});

  Names.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}

class Companies {
  String title;
  String image;
  String id;

  Companies({this.title, this.image, this.id});

  Companies.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}