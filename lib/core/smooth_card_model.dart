class SmoothCardModel {
  final String uid;
  final String name;
  final String symbole;
  final String color;
  final String img;

  SmoothCardModel({
    required this.uid,
    required this.name,
    required this.symbole,
    required this.color,
    required this.img,
  });

  factory SmoothCardModel.fromJson(json) {
    return SmoothCardModel(
      uid: json['uid'],
      name: json['name'],
      symbole: json['symbole'],
      color: json['color'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'uid': uid,
      'name': name,
      'symbole': symbole,
      'color': color,
      'img': img,
    };
  }
}
