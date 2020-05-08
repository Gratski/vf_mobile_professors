import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/difficulty_level.model.dart';
import 'package:professors/models/language_context/language_context.model.dart';

part 'edit_class_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class EditClassState extends _EditClassState with _$EditClassState {
  EditClassState();
}

// The store-class
abstract class _EditClassState with Store {


}