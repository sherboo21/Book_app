class BooksDataModel {
  List<Results>? results;

  BooksDataModel({this.results});

  BooksDataModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  int? id;
  String? title;
  List<Authors>? authors;
  List<String>? summaries;
  Formats? formats;

  Results({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.formats,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(Authors.fromJson(v));
      });
    }
    summaries = json['summaries'].cast<String>();
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
  }
}

class Authors {
  String? name;

  Authors({
    this.name,
  });

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class Formats {
  String? imageJpeg;

  Formats({
    this.imageJpeg,
  });

  Formats.fromJson(Map<String, dynamic> json) {
    imageJpeg = json['image/jpeg'];
  }
}
