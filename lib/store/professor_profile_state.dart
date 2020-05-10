import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';

part 'professor_profile_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class ProfessorProfileState extends _ProfessorProfileState with _$ProfessorProfileState {}

abstract class _ProfessorProfileState with Store {

  @observable
  bool isLoading = true;

  @observable
  int id = 0;

  @observable
  String languageCode = '';

  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String pictureUrl;

  @observable
  String designation = "";

  @observable
  String about = "";

  @observable
  String quote = "";

  @observable
  ObservableList<CategoryModel> teaches = ObservableList.of([]);

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setId(int id) {
    this.id = id;
  }

  @action
  setLanguageCode(String code) {
    this.languageCode = code;
  }

  @action
  setPictureUrl(String url) {
    this.pictureUrl = url;
  }

  @action
  setFirstName(String name) {
    this.firstName = name;
  }

  @action
  setLastName(String name) {
    this.lastName = name;
  }

  @action
  setDesignation(String designation) {
    this.designation = designation;
  }

  @action
  setAbout(String about) {
    this.about = about;
  }

  @action
  setQuote(String quote) {
    this.quote = quote;
  }

  @action
  setTeaches(List<CategoryModel> teaches) {
    this.teaches.clear();
    this.teaches.addAll(teaches);
  }

}