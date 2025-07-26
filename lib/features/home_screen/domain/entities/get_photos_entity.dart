class PhotosEntity {
  PhotosEntity({
    this.id,
    this.width,
    this.height,
    this.url,
    this.src,
  });

  num? id;
  num? width;
  num? height;
  String? url;
  SrcEntity? src;
}

class SrcEntity {
  SrcEntity({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;
}
