class GameModel {
  final String uid;
  final String title;
  final String nbJoueur;
  final String createdBy; // user uid
  final DateTime date; // user uid

  GameModel({
    required this.uid,
    required this.title,
    required this.nbJoueur,
    required this.createdBy,
    required this.date,
  });

  factory GameModel.fromJson(json) {
    return GameModel(
      uid: json['uid'],
      title: json['title'],
      nbJoueur: json['nbJoueur'],
      createdBy: json['createdBy'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'uid': uid,
      'title': title,
      'nbJoueur': nbJoueur,
      'createdBy': createdBy,
      'date': date.toString(),
    };
  }
}
