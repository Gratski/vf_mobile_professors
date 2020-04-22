import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/buttons/buttons_builder.dart';
import 'package:professors/localization/constants/general_constants.dart'
    as GENERAL_TRANSLATIONS;
import 'package:professors/localization/constants/settings_personal_details.dart'
    as SCREEN_TRANSLATIONS;
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SettingsPersonalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarBuilder.sliverAppBarWithSaveButton(context, 
            AppLocalizations.of(context).translate(SCREEN_TRANSLATIONS.PersonalDetailsConstants.TOP_HEADER)
          ),
          SliverToBoxAdapter(
            key: Key('form_box'),
            child: Container(
              padding: PaddingsBuilder.regularPadding(context),
              child: Form(
                key: Key('personal_details_form'),
                child: ListView(
                  shrinkWrap: true,
                  key: Key('list_view_key'),
                  children: <Widget>[
                    /// FIRSTNAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                                .PersonalDetailsConstants.FIRSTNAME_LABEL)),
                        TextFormField(
                            key: Key('input_firstname'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(SCREEN_TRANSLATIONS
                                        .PersonalDetailsConstants
                                        .FIRSTNAME_HINT)))
                      ],
                    ),

                    /// LASTNAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                                .PersonalDetailsConstants.LASTNAME_LABEL)),
                        TextFormField(
                            key: Key('input_lastname'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(SCREEN_TRANSLATIONS
                                        .PersonalDetailsConstants
                                        .LASTNAME_HINT)))
                      ],
                    ),

                    /// GENDER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                                .PersonalDetailsConstants.LASTNAME_LABEL)),
                        DropdownButton<String>(
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          value: 'Male',
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(height: 0),
                          onChanged: (String newValue) {},
                          items: <String>[
                            AppLocalizations.of(context).translate(GENERAL_TRANSLATIONS.GeneralConstants.LABEL_GENDER_MALE),
                            AppLocalizations.of(context).translate(GENERAL_TRANSLATIONS.GeneralConstants.LABEL_GENDER_FEMALE)
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),

                    /// BIRTHDAY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                            .PersonalDetailsConstants.BIRTHDAY_HINT)),
                        Container(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: new Theme(
                              data: Theme.of(context).copyWith(
                                primaryColor: Colors.red
                              ),
                              child: GestureDetector(
                                child: Text('Birthday here'),
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now().subtract(new Duration(days: (365 * 70))),
                                    lastDate: DateTime.now(),
                                  ).then((date) => {
                                    print('A new date has been selected')
                                  });
                                },
                              )),
                        )
                      ],
                    ),

                    /// EMAIL
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                            .PersonalDetailsConstants.EMAIL_LABEL)),
                        TextFormField(
                            key: Key('input_email'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(SCREEN_TRANSLATIONS
                                    .PersonalDetailsConstants
                                    .EMAIL_HINT)))
                      ],
                    ),

                    /// PHONE NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                            .PersonalDetailsConstants.PHONE_NUMBER_LABEL)),
                        TextFormField(
                            key: Key('input_phone_number'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(SCREEN_TRANSLATIONS
                                    .PersonalDetailsConstants
                                    .PHONE_NUMBER_HINT)))
                      ],
                    ),

                    /// VAT NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                            .PersonalDetailsConstants.VAT_LABEL)),
                        TextFormField(
                            key: Key('input_vat_number'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(SCREEN_TRANSLATIONS
                                    .PersonalDetailsConstants
                                    .VAT_HINT)))
                      ],
                    ),

                    /// NATIONALITY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(SCREEN_TRANSLATIONS
                            .PersonalDetailsConstants.LASTNAME_LABEL)),
                        DropdownButton<String>(
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          value: 'Portuguese',
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(height: 0),
                          onChanged: (String newValue) {},
                          items: <String>['Portuguese', 'North American']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                          ).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
