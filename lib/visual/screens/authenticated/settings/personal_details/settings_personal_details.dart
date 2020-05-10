import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/personal_details/settings_personal_details.dart';
import 'package:professors/models/gender.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/settings/personal_details/settings_gender.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/personal_details/settings_nationality.screen.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/utils/date_utils.dart';
import 'package:professors/utils/gender_utils.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

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
    this.screenStore.setLivingIn(userStore.livingInId, userStore.livingInLabel);
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
                      .translate(generalConstants.buttonSaveLabel).toUpperCase(),
                  () {
                    restServices.getUserService().updateUserPersonalDetails(context,
                        firstNameController.text,
                        lastNameController.text,
                        screenStore.gender == Gender.MALE ? "MALE" : "FEMALE",
                        screenStore.countryId,
                        screenStore.livingInId,
                        phoneNumberController.text,
                        screenStore.birthday)
                        .then((value) {
                      restServices.getUserService().getUserPersonalDetails(context);
                      ToasterBuilder.buildSuccessToaster(context, "successfully updated");
                    })
                        .catchError((e) {
                          String msg = "Something went wrong";
                          if ( e is ApiException ) {
                            msg = e.cause;
                          } else {
                            print(e);
                          }
                          ToasterBuilder.buildErrorToaster(context, msg);
                    });
                  },
                ),
              ],
            ),

            /// HEADER
            AppHeaderWidget(
              AppLocalizations.of(context).translate(screenConstants.topHeader),
            ),

            // show only if is not loading


            /// FIELDS TO EDIT
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
                          padding: AppPaddings.regularPadding(context),
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            controller: firstNameController,
                            onChanged: (value) => screenStore.setFirstName(value),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).translate(screenConstants.firstNameHint),
                              labelText: AppLocalizations.of(context).translate(screenConstants.firstNameLabel).toUpperCase(),
                            ),
                          ),
                        ),

                        /// LASTNAME
                        Container(
                          padding: AppPaddings.regularPadding(context),
                          margin: EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            controller: lastNameController,
                            onChanged: (value) => screenStore.setLastName(value),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).translate(screenConstants.lastNameHint),
                              labelText: AppLocalizations.of(context).translate(screenConstants.lastNameLabel).toUpperCase(),
                            ),
                          ),
                        ),

                        /// EMAIL
                        /*
                        Container(
                          padding: AppPaddings.regularPadding(context),
                          margin: EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            enabled: false,
                            controller: emailController,
                            onChanged: (value) => screenStore.setFirstName(value),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).translate(screenConstants.emailHint),
                              labelText: AppLocalizations.of(context).translate(screenConstants.emailLabel).toUpperCase(),
                            ),
                          ),
                        ),
                         */

                        /// PHONE NUMBER
                        Container(
                          padding: AppPaddings.regularPadding(context),
                          margin: EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                          child: TextFormField(
                            style: TextStyle(color: AppColors.fontColor),
                            controller: phoneNumberController,
                            onChanged: (value) => screenStore.setPhoneNumber(value),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).translate(screenConstants.phoneNumberHint),
                              labelText: AppLocalizations.of(context).translate(screenConstants.phoneNumberLabel).toUpperCase(),
                            ),
                          ),
                        ),

                        /// BIRTHDAY
                        Container(
                          padding: AppPaddings.regularPadding(context),
                          margin:
                          EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                          child: Observer(
                            builder: (_) => Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextsBuilder.textHint(AppLocalizations.of(context)
                                      .translate(screenConstants.birthdayHint).toUpperCase()),
                                  GestureDetector(
                                    onTap: () async {
                                      DateTime newBirthday =
                                      await showRoundedDatePicker(
                                        context: context,
                                        theme: ThemeData.dark().copyWith(
                                          accentColor: AppColors.regularRed,
                                          primaryColor: AppColors.bgMainColor,
                                          backgroundColor: AppColors.bgMainColor,
                                          dialogBackgroundColor: AppColors.bgMainColor,
                                          accentTextTheme: TextTheme(
                                            body2 : TextStyle(color: AppColors.fontColor),
                                          ),
                                        ),
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
                          padding: AppPaddings.regularPadding(context),
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
                                          .translate(screenConstants.genderHint).toUpperCase(),
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

                        /// CURRENTLY LIVING IN
                        Container(
                          padding: AppPaddings.regularPadding(context),
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
                                            SettingsNationalityScreen(screenStore.livingInId, screenStore.setLivingIn)),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextsBuilder.textHint(
                                      AppLocalizations.of(context)
                                          .translate(screenConstants.currentlyLivingInHint).toUpperCase(),
                                    ),
                                    Container(
                                      child: TextsBuilder.regularText(
                                          screenStore.livingInLabel),
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
                          padding: AppPaddings.regularPadding(context),
                          margin:
                          EdgeInsets.only(top: AppSizes.inputTopMargin(context), bottom: AppSizes.inputTopMargin(context) * 2),
                          child: Observer(
                            builder: (_) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SettingsNationalityScreen(screenStore.countryId, screenStore.setCountry)),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextsBuilder.textHint(
                                      AppLocalizations.of(context)
                                          .translate(screenConstants.nationalityHint).toUpperCase(),
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
