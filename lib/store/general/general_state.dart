import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/language.model.dart';

part 'general_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class GeneralState extends _GeneralState with _$GeneralState {
  GeneralState();
}

// The store-class
abstract class _GeneralState with Store {

  ////////////////////////////////////////////////////////////////
  // General
  ////////////////////////////////////////////////////////////////
  /// True when the app is ready
  @observable
  bool isReady = true;

  ////////////////////////////////////////////////////////////////
  // Categories Related
  ////////////////////////////////////////////////////////////////
  /// First Level Categories list always available
  @observable
  bool isCategoriesLoading = false;
  @observable
  ObservableList<CategoryModel> categories = ObservableList.of([],);

  /// Second level of Categories
  @observable
  bool isSubCategoriesLoading = false;
  @observable
  ObservableList<CategoryModel> subCategories = ObservableList.of([],);

  ////////////////////////////////////////////////////////////////
  // Languages Related
  ////////////////////////////////////////////////////////////////
  /// Profile Available Languages to be associated with the profile
  @observable
  bool isAvailableLanguagesLoading = false;
  @observable
  ObservableList<LanguageModel> availableLanguages = ObservableList.of([],);

  /// Existing Language Context Languages
  @observable
  bool isExistingLanguagesLoading = false;
  @observable
  ObservableList<LanguageModel> existingLanguages = ObservableList.of([],);

  ////////////////////////////////////////////////////////////////
  // Categories Related
  ////////////////////////////////////////////////////////////////
  @action
  setIsCategoriesLoading(bool isLoading) {
    this.isCategoriesLoading = isLoading;
  }
  @action
  setCategories(List<CategoryModel> categories){
    this.categories.addAll(categories);
  }

  @action
  setIsSubCategoriesLoading(bool isLoading) {
    this.isSubCategoriesLoading = isLoading;
  }
  @action
  setSubCategories(List<CategoryModel> subCategorires) {
    this.subCategories = subCategories;
  }

  ////////////////////////////////////////////////////////////////
  // Language Profiles Related
  ////////////////////////////////////////////////////////////////
  @action
  setIsAvailableLanguagesLoading(bool isLoading) {
    this.isAvailableLanguagesLoading = isLoading;
  }
  @action
  setAvailableLanguages(List<LanguageModel> languages) {
    this.availableLanguages.clear();
    this.availableLanguages.addAll(languages);
  }

  @action
  setIsExistingLanguagesLoading(bool isLoading) {
    this.isExistingLanguagesLoading = isLoading;
  }
  @action
  setExistingLanguages(List<LanguageModel> languages) {
    this.existingLanguages.clear();
    this.existingLanguages.addAll(languages);
  }

  ////////////////////////////////////////////////////////////////
  // General
  ////////////////////////////////////////////////////////////////
  @action
  setIsReady(bool isReady){
    this.isReady = isReady;
  }

}