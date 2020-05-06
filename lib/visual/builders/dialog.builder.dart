import 'package:flutter/material.dart';
import 'package:professors/visual/widgets/dialogs/comment_options.dialog.dart';
import 'package:professors/visual/widgets/dialogs/edit_payment_method.dialog.dart';
import 'package:professors/visual/widgets/dialogs/unavailable_operation.dialog.dart';

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

  editPaymentMethodDialog(VoidCallback makeDefaultCallback, VoidCallback deleteCallback) {
    showDialog(
      context: context,
      builder: (BuildContext context) => EditPaymentMethodDialog(makeDefaultCallback, deleteCallback),
    );
  }

}