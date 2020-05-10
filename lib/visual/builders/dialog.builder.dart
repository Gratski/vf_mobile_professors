import 'package:flutter/material.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/visual/widgets/dialogs/comment_options.dialog.dart';
import 'package:professors/visual/widgets/dialogs/confirmation.dialog.dart';
import 'package:professors/visual/widgets/dialogs/edit_payment_method.dialog.dart';
import 'package:professors/visual/widgets/dialogs/select_language.dialog.dart';
import 'package:professors/visual/widgets/dialogs/unavailable_operation.dialog.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

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

  editPaymentMethodDialog(
      VoidCallback makeDefaultCallback, VoidCallback deleteCallback) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          EditPaymentMethodDialog(makeDefaultCallback, deleteCallback),
    );
  }

  confirmationDialog(String title, String subTitle,
      VoidCallback confirmationCallBack, VoidCallback cancelCallback) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmationDialog(
          title, subTitle, confirmationCallBack, cancelCallback),
    );
  }

  selectLanguageDialog(String title, List<LanguageModel> options,
      int selectedId, Function callback) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextsBuilder.h3LightSpan('$title\n'),
                  TextsBuilder.regularSpan('You can add more languages to your profile', color: AppColors.bgMainColor)
                ],
              ),
            ),
            content: Container(
              width: double.maxFinite,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if ( options[index].id != selectedId ) {
                            callback(options[index]);
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              (selectedId == options[index].id) ?
                              TextsBuilder.regularText(options[index].designation, color: AppColors.bgMainColor, bold: true) :
                              TextsBuilder.regularText(options[index].designation, color: AppColors.bgMainColor)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]),
            ),
          );
        });
  }
}
