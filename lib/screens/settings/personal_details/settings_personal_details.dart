import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/personal_details/settings_personal_details.dart';
import 'package:professors/screens/settings/personal_details/settings_nationality.screen.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SettingsPersonalDetailsScreen extends StatelessWidget {
  final GeneralConstants generalConstants = GeneralConstants();
  final PersonalDetailsConstants screenConstants = PersonalDetailsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar([
            ButtonsBuilder.transparentButton(
                AppLocalizations.of(context)
                    .translate(generalConstants.buttonSaveLabel),
                () {})
          ]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.topHeader)),
          SliverToBoxAdapter(
            key: Key('form_box'),
            child: Container(
              padding: AppPaddings.regularPadding(context),
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
                        TextFormField(
                          key: Key('input_firstname'),
                          decoration: InputDecoration(
                            hintText: 'write your first name',
                            labelText: 'First Name',
                          ),
                        ),
                      ],
                    ),

                    /// LASTNAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                            key: Key('input_lastname'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: AppLocalizations.of(context)
                                    .translate(screenConstants.lastNameLabel),
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
                          style: TextStyle(color: AppColors.fontColor),
                          underline: Container(height: 0),
                          onChanged: (String newValue) {},
                          items: <String>[
                            AppLocalizations.of(context)
                                .translate(generalConstants.genderMaleLabel),
                            AppLocalizations.of(context)
                                .translate(generalConstants.genderFemaleLabel)
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
                        TextFormField(
                            key: Key('input_email'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: AppLocalizations.of(context)
                                    .translate(screenConstants.emailLabel),
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.emailHint)))
                      ],
                    ),

                    /// PHONE NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                            key: Key('input_phone_number'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: AppLocalizations.of(context)
                                    .translate(screenConstants.phoneNumberLabel),
                                hintText: AppLocalizations.of(context)
                                    .translate(
                                        screenConstants.phoneNumberHint)))
                      ],
                    ),

                    /// VAT NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                            key: Key('input_vat_number'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: AppLocalizations.of(context)
                                    .translate(screenConstants.vatLabel),
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.vatHint)))
                      ],
                    ),
                    /// VAT NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SettingsNationalityScreen()
                              ),);
                            },
                            key: Key('input_nationality'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: AppLocalizations.of(context)
                                    .translate(screenConstants.nationalityHint),
                                hintText: AppLocalizations.of(context)
                                    .translate(screenConstants.nationalityHint)))
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
