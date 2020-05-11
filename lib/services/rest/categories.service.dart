import 'package:flutter/cupertino.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:professors/visual/builders/toaster.builder.dart';

class CategoryService extends AbstractRestService {

  ///
  /// Gets the top level categories
  ///
  Future<List<CategoryModel>> getCategories(BuildContext context) async {
    try {
      final rsp = await performJsonGet(context, '$REST_URL/categories');
      List<dynamic> list = decodeBody(rsp)["items"];
      List<CategoryModel> categories = List.of([]);
      list.forEach((elem) {
        categories.add(new CategoryModel(
          elem["id"],
          elem["designation"],
          elem["description"]
        ),);
      },);
      return categories;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.internetConnectionText));
    }
  }

  ///
  /// Gets the top level sub categories
  ///
  Future<List<CategoryModel>> getSubCategories(BuildContext context, parentId) async {
    try {
      final rsp = await performJsonGet(context, '$REST_URL/categories/$parentId/sub-categories');
      List<dynamic> list = decodeBody(rsp)["items"];
      List<CategoryModel> categories = List.of([]);
      list.forEach((elem) {
        categories.add(new CategoryModel(
            elem["id"],
            elem["designation"],
            elem["description"]
        ),);
      },);
      return categories;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.internetConnectionText));
    } finally {
      generalStore.setIsCategoriesLoading(false);
    }
  }

}