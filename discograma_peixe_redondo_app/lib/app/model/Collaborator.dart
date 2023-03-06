// ignore_for_file: file_names

class Collaborator {
  bool expanded;
  String collaboratorName;
  String collaboratordiscription;
  String collaboratorImg;

  Collaborator({
    this.expanded = false,
    required this.collaboratorName,
    required this.collaboratordiscription,
    required this.collaboratorImg,
  });
  static Collaborator fromJson(json) => Collaborator(
      collaboratorName: json[' collaboratorName'],
      collaboratordiscription: json['collaboratordiscription'],
      collaboratorImg: json['collaboratorImg']);
}
