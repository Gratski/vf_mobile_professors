import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/personal_details/settings_personal_details.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SettingsPersonalDetailsScreen extends StatelessWidget {

  final GeneralConstants generalConstants = GeneralConstants();
  final PersonalDetailsConstants screenConstants = PersonalDetailsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithSaveButton(context, () {}),
      body: CustomScrollView(
        slivers: <Widget>[
          TopTitleWidget(AppLocalizations.of(context).translate(screenConstants.topHeader), 'SettingsPersonalDetailsTitleKey'),
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
                            .translate(screenConstants.firstNameLabel)),
                        TextFormField(
                            key: Key('input_firstname'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.firstNameHint)))
                      ],
                    ),

                    /// LASTNAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(screenConstants.lastNameLabel)),
                        TextFormField(
                            key: Key('input_lastname'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.lastNameHint)))
                      ],
                    ),

                    /// GENDER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(screenConstants.genderHint)),
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
                            AppLocalizations.of(context).translate(
                                generalConstants.genderMaleLabel
                            ),
                            AppLocalizations.of(context).translate(
                                generalConstants.genderFemaleLabel
                            )
                          ].map<DropdownMenuItem<String>>(
                            (String value) {
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
                            .translate(screenConstants.birthdayHint)),
                        Container(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: new Theme(
                              data: Theme.of(context)
                                  .copyWith(primaryColor: Colors.red),
                              child: GestureDetector(
                                child: Text('Birthday here'),
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now().subtract(
                                        new Duration(days: (365 * 70))),
                                    lastDate: DateTime.now(),
                                  ).then((date) =>
                                      {print('A new date has been selected')});
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
                            .translate(screenConstants.emailLabel)),
                        TextFormField(
                            key: Key('input_email'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.emailHint)))
                      ],
                    ),

                    /// PHONE NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(screenConstants.phoneNumberLabel)),
                        TextFormField(
                            key: Key('input_phone_number'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.phoneNumberHint)))
                      ],
                    ),

                    /// VAT NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(screenConstants.vatLabel)),
                        TextFormField(
                            key: Key('input_vat_number'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.vatHint)))
                      ],
                    ),

                    /// NATIONALITY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.textHint(AppLocalizations.of(context)
                            .translate(screenConstants.nationalityHint)),
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
                              .map<DropdownMenuItem<String>>(
                            (String value) {
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
