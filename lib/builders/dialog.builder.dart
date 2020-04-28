import 'package:flutter/material.dart';
import 'package:professors/widgets/dialogs/comment_options.dialog.dart';
import 'package:professors/widgets/dialogs/unavailable_operation.dialog.dart';

class DialogsBuilder {

  BuildContext context;
  DialogsBuilder(this.context);

  unavailableOperation() {
    showDialog(
      context: context,
      builder: (BuildContext context) => UnavailableOperationDialog(),
    );
  }

  reportCommentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => CommentOptionsDialog(),
    );
  }

}