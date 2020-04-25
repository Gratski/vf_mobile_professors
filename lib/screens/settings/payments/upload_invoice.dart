import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SendInvoiceScreen extends StatefulWidget {
  @override
  _SendInvoiceScreenState createState() => _SendInvoiceScreenState();
}

class _SendInvoiceScreenState extends State<SendInvoiceScreen> {

  PaymentsConstants screenConstants = PaymentsConstants();

  Future getImage(ImageSource _source) async {
    var image = await ImagePicker.pickImage(source: _source);
  }

  showDialog(BuildContext context) {
    showCupertinoDialog(
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Select file source'),
        message: Text("From one of the options"),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: CupertinoNavigationBar(
              middle: Text(
                'File System',
              ),
              leading: Icon(Icons.camera_alt, color: Colors.red),
              backgroundColor: Colors.transparent,
              border: Border(bottom: BorderSide(style: BorderStyle.none)),
            ),
            onPressed: () async {
              File file = await FilePicker.getFile(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'pdf', 'doc']);
            },
          ),
          CupertinoActionSheetAction(
            child: CupertinoNavigationBar(
              middle: Text(
                'Photo Library',
              ),
              leading: Icon(Icons.photo_library),
              backgroundColor: Colors.transparent,
              border: Border(bottom: BorderSide(style: BorderStyle.none)),
            ),
            onPressed: () {
              Navigator.pop(context);
              getImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithTitle(context, null),
      body: CustomScrollView(
        slivers: <Widget>[
          TopTitleWidget(
            AppLocalizations.of(context)
                .translate(screenConstants.sendInvoiceTopHeader),
            'SettingsUploadInvoiceTitleKey'
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
                        // if is android
                        if (Theme.of(context).platform ==
                            TargetPlatform.android) {
                          File file = await FilePicker.getFile(
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'pdf', 'doc'],
                          );
                        } else if (Theme.of(context).platform ==
                            TargetPlatform.iOS) {
                          showDialog(context);
                        }
                      },
                      Icon(
                        Icons.file_upload,
                        color: Colors.white,
                      ),
                    ),
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
