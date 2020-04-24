import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SendInvoiceScreen extends StatelessWidget {
  PaymentsConstants screenConstants = PaymentsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithTitle(context, null),
      body: CustomScrollView(
        slivers: <Widget>[
          TopTitleWidget(
            AppLocalizations.of(context)
                .translate(screenConstants.sendInvoiceTopHeader),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: PaddingsBuilder.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: TextsBuilder.regularText(AppLocalizations.of(context)
                  .translate(screenConstants.sendInvoiceSubTitle)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              padding: PaddingsBuilder.regularPadding(context),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ButtonsBuilder.redFlatButtonWithIcon(
                        AppLocalizations.of(context).translate(
                            screenConstants.sendInvoiceUploadButtonLabel),
                            () async {
                              File file = await FilePicker.getFile();
                            },
                        Icon(
                          Icons.file_upload,
                          color: Colors.white,
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
