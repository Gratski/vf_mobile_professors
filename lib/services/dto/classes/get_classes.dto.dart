import 'package:professors/models/classes/class_list_item.dart';

class GetClassesDTO {

  int total;
  List<ClassListItemModel> items;
  GetClassesDTO(this.total, this.items);

}