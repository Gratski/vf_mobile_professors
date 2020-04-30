import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/personal_details/settings_personal_details.dart';
import 'package:professors/screens/authenticated/settings/personal_details/settings_gender.screen.dart';
import 'package:professors/screens/authenticated/settings/personal_details/settings_nationality.screen.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/styles/sizes.dart';
import 'package:professors/utils/date_utils.dart';
import 'package:professors/utils/gender_utils.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SettingsPersonalDetailsScreen extends StatelessWidget {
  final GeneralConstants generalConstants = GeneralConstants();
  final PersonalDetailsConstants screenConstants = PersonalDetailsConstants();

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // store
  EditProfileDetailsState screenStore = EditProfileDetailsState();

  // input controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  SettingsPersonalDetailsScreen() {
    this.screenStore.setFirstName(userStore.firstName);
    this.screenStore.setLastName(userStore.lastName);
    this.screenStore.setEmail(userStore.email);
    this.screenStore.setCountry(userStore.countryId, userStore.countryLabel);
    this.screenStore.setBirthday(userStore.birthday);
    this.screenStore.setPhoneNumber(userStore.phoneNumber);

    firstNameController.text = this.screenStore.firstName;
    lastNameController.text = this.screenStore.lastName;
    emailController.text = this.screenStore.email;
    phoneNumberController.text = this.screenStore.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              [
                ButtonsBuilder.transparentButton(
                  AppLocalizations.of(context)
                      .translate(generalConstants.buttonSaveLabel),
                  () {},
                ),
              ],
            ),
            AppHeaderWidget(
              AppLocalizations.of(context).translate(screenConstants.topHeader),
            ),
            // fields to edit
            SliverList(
              key: GlobalKey(),
              delegate: SliverChildListDelegate(
                [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// FIRSTNAME
                        Container(
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            controller: firstNameController,
                            onChanged: (value) => screenStore.setFirstName(value),
                            decoration: InputDecoration(
                              hintText: 'write your first name',
                              labelText: 'First Name',
                            ),
                          ),
                        ),

                        /// LASTNAME
                        Container(
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            controller: lastNameController,
                            onChanged: (value) => screenStore.setLastName(value),
                            decoration: InputDecoration(
                              hintText: 'write your last name',
                              labelText: 'Last Name',
                            ),
                          ),
                        ),

                        /// EMAIL
                        Container(
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            enabled: false,
                            controller: emailController,
                            onChanged: (value) => screenStore.setFirstName(value),
                            decoration: InputDecoration(
                              hintText: 'write your first name',
                              labelText: 'First Name',
                            ),
                          ),
                        ),

                        /// PHONE NUMBER
                        Container(
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            controller: phoneNumberController,
                            onChanged: (value) => screenStore.setPhoneNumber(value),
                            decoration: InputDecoration(
                              hintText: 'write your phone number',
                              labelText: 'Phone Number',
                            ),
                          ),
                        ),

                        /// BIRTHDAY
                        Container(
                          margin:
                          EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                          child: Observer(
                            builder: (_) => Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextsBuilder.textHint(AppLocalizations.of(context)
                                      .translate(screenConstants.birthdayHint)),
                                  GestureDetector(
                                    onTap: () async {
                                      DateTime newBirthday =
                                      await showRoundedDatePicker(
                                        context: context,
                                        theme: ThemeData.dark(),
                                        initialDate: screenStore.birthday,
                                        firstDate: DateTime.now()
                                            .subtract(new Duration(days: (365 * 70))),
                                        lastDate: DateTime.now(),
                                      );

                                      if (newBirthday != null) {
                                        screenStore.setBirthday(newBirthday);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: TextsBuilder.regularText(
                                        DateUtils(context)
                                            .fromDateToString(screenStore.birthday),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// GENDER
                        Container(
                          margin:
                          EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                          child: Observer(
                            builder: (_) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SettingsGenderScreen(screenStore),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextsBuilder.textHint(
                                      AppLocalizations.of(context)
                                          .translate(screenConstants.genderHint),
                                    ),
                                    Container(
                                      child: TextsBuilder.regularText(GenderUtils()
                                          .getGenderString(
                                          screenStore.gender, context)),
                                      margin: EdgeInsets.only(top: 10),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        /// NATIONALITY
                        Container(
                          margin:
                          EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                          child: Observer(
                            builder: (_) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SettingsNationalityScreen(screenStore)),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextsBuilder.textHint(
                                      AppLocalizations.of(context)
                                          .translate(screenConstants.nationalityHint),
                                    ),
                                    Container(
                                      child: TextsBuilder.regularText(
                                          screenStore.countryLabel),
                                      margin: EdgeInsets.only(top: 10),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
