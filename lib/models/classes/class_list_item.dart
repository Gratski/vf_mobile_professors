class ClassListItemModel {

  final String designation, description, pictureUrl, languageCode;
  final int id, languageId, difficultyLevel, duration, status;
  final bool isActive;

  ClassListItemModel(this.id, this.languageId, this.designation,
      this.description, this.pictureUrl, this.languageCode, this.difficultyLevel,
      this.duration, this.status, this.isActive);

}