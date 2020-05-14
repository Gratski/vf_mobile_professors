import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/payments/payments_constants.dart';
import 'package:professors/visual/builders/dialog.builder.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class SendInvoiceScreen extends StatefulWidget {
  @override
  _SendInvoiceScreenState createState() => _SendInvoiceScreenState();
}

class _SendInvoiceScreenState extends State<SendInvoiceScreen> {

  PaymentsConstants screenConstants = PaymentsConstants();
  GeneralConstants generalConstants = GeneralConstants();

  Future getImage(ImageSource _source) async {
    var image = await ImagePicker.pickImage(source: _source);
  }

  showDialog(BuildContext context, GlobalKey<ScaffoldState> key) {
    key.currentState.showBottomSheet((context){
      return CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              AppLocalizations.of(context).translate(generalConstants.buttonCancelLabel),
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(AppLocalizations.of(context).translate(generalConstants.selectFileSourceLabel)),
          message: Text(AppLocalizations.of(context).translate(generalConstants.selectFileSourceSubLabel)),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: CupertinoNavigationBar(
                middle: Text(
                  AppLocalizations.of(context).translate(generalConstants.buttonFileSystemLabel),
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
                  AppLocalizations.of(context).translate(generalConstants.buttonPhotoLibraryLabel),
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
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    final sKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: sKey,
      body: CustomScrollView(
        slivers: <Widget>[

          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.sendInvoiceTopHeader)),

          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: RichText(
                text: TextsBuilder.subTitleSpan(AppLocalizations.of(context)
                    .translate(screenConstants.sendInvoiceSubTitle)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              padding: AppPaddings.regularPadding(context),
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
                        DialogsBuilder(context).unavailableOperation();
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
