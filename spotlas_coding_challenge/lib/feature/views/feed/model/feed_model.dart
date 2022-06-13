import 'package:vexana/vexana.dart';

class Post extends INetworkModel<Post> {
  String? id;
  Caption? caption;
  List<Media>? media;
  String? createdAt;
  Author? author;
  Spot? spot;
  int? relevantComments;
  int? numberOfComments;
  int? numberOfLikes;
  List<Tags>? tags;

  Post(
      {this.id,
      this.caption,
      this.media,
      this.createdAt,
      this.author,
      this.spot,
      this.relevantComments,
      this.numberOfComments,
      this.numberOfLikes,
      this.tags});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'] != null ? new Caption.fromJson(json['caption']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    author = json['author'] != null ? new Author.fromJson(json['author']) : null;
    spot = json['spot'] != null ? new Spot.fromJson(json['spot']) : null;
    relevantComments = json['relevant_comments'];
    numberOfComments = json['number_of_comments'];
    numberOfLikes = json['number_of_likes'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.caption != null) {
      data['caption'] = this.caption!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.spot != null) {
      data['spot'] = this.spot!.toJson();
    }
    data['relevant_comments'] = this.relevantComments;
    data['number_of_comments'] = this.numberOfComments;
    data['number_of_likes'] = this.numberOfLikes;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Post fromJson(Map<String, dynamic> json) {
    return Post.fromJson(json);
  }
}

class Caption {
  String? text;

  Caption({this.text});

  Caption.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class Media {
  String? url;
  String? type;

  Media({this.url, this.type});

  Media.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class Author {
  String? id;
  String? username;
  String? photoUrl;
  String? fullName;
  bool? isPrivate;
  bool? isVerified;

  Author({this.id, this.username, this.photoUrl, this.fullName, this.isPrivate, this.isVerified});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    photoUrl = json['photo_url'];
    fullName = json['full_name'];
    isPrivate = json['is_private'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['photo_url'] = this.photoUrl;
    data['full_name'] = this.fullName;
    data['is_private'] = this.isPrivate;
    data['is_verified'] = this.isVerified;
    return data;
  }
}

class Spot {
  String? id;
  String? name;
  List<Types>? types;
  Logo? logo;
  Location? location;
  bool? isSaved;

  Spot({this.id, this.name, this.types, this.logo, this.location, this.isSaved});

  Spot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    isSaved = json['is_saved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['is_saved'] = this.isSaved;
    return data;
  }
}

class Types {
  int? id;
  String? name;
  String? url;

  Types({this.id, this.name, this.url});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Logo {
  String? url;
  String? blurHash;
  String? type;

  Logo({this.url, this.blurHash, this.type});

  Logo.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    blurHash = json['blur_hash'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['blur_hash'] = this.blurHash;
    data['type'] = this.type;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;
  String? display;

  Location({this.latitude, this.longitude, this.display});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['display'] = this.display;
    return data;
  }
}

class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
