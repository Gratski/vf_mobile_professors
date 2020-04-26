import 'package:flutter/material.dart';
import 'package:professors/widgets/dialogs/unavailable:operation.dialog.dart';

class DialogsBuilder {

  BuildContext context;
  DialogsBuilder(this.context);

  unavailableOperation() {
    showDialog(
      context: context,
      builder: (BuildContext context) => UnavailableOperationDialog(),
    );
  }

}