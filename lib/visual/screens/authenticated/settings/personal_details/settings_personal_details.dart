import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/form_validation.constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/settings/personal_details/settings_personal_details.dart';
import 'package:professors/models/gender.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/settings/personal_details/settings_gender.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/personal_details/settings_nationality.screen.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/utils/date_utils.dart';
import 'package:professors/utils/gender_utils.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class SettingsPersonalDetailsScreen extends StatefulWidget {

  // context
  BuildContext context;

  // constants
  final GeneralConstants generalConstants = GeneralConstants();
  final FormValidationConstants formConstants = FormValidationConstants();
  final PersonalDetailsConstants screenConstants = PersonalDetailsConstants();

  // form key
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // store
  EditProfileDetailsState screenStore = EditProfileDetailsState();

  // input controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // form autovalidate flag
  bool autoValidate = false;

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
  _SettingsPersonalDetailsScreenState createState() => _SettingsPersonalDetailsScreenState();
}

class _SettingsPersonalDetailsScreenState extends State<SettingsPersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    widget.context = context;
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (widget.screenStore.isLoading) {
            return DefaultLoaderWidget();
          } else {
            return CustomScrollView(
              slivers: <Widget>[
                CustomAppBar(
                  [
                    ButtonsBuilder.transparentButton(
                      AppLocalizations.of(context)
                          .translate(widget.generalConstants.buttonSaveLabel).toUpperCase(),
                          () {
                        _save();
                      },
                    ),
                  ],
                ),

                /// HEADER
                AppHeaderWidget(
                  AppLocalizations.of(context).translate(widget.screenConstants.topHeader),
                ),
                /// FIELDS TO EDIT
                SliverPadding(
                  padding: AppPaddings.regularPadding(context),
                  sliver: SliverList(
                    key: GlobalKey(),
                    delegate: SliverChildListDelegate(
                      [
                        Form(
                          key: widget._formKey,
                          autovalidate: widget.autoValidate,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              /// FIRSTNAME
                              Container(
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                                child: TextFormField(
                                  maxLength: 12,
                                  style: TextStyle(color: AppColors.fontColor),
                                  controller: widget.firstNameController,
                                  onChanged: (value) => widget.screenStore.setFirstName(value),
                                  validator: _firstNameValidator,
                                  decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context).translate(widget.screenConstants.firstNameHint),
                                    labelText: AppLocalizations.of(context).translate(widget.screenConstants.firstNameLabel).toUpperCase(),
                                  ),
                                ),
                              ),

                              /// LASTNAME
                              Container(
                                margin: EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                                child: TextFormField(
                                  maxLength: 12,
                                  style: TextStyle(color: AppColors.fontColor),
                                  controller: widget.lastNameController,
                                  onChanged: (value) => widget.screenStore.setLastName(value),
                                  validator: _lastNameValidator,
                                  decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context).translate(widget.screenConstants.lastNameHint),
                                    labelText: AppLocalizations.of(context).translate(widget.screenConstants.lastNameLabel).toUpperCase(),
                                  ),
                                ),
                              ),

                              /// PHONE NUMBER
                              Container(
                                margin: EdgeInsets.only(top: AppSizes.inputTopMargin(context)),
                                child: TextFormField(
                                  style: TextStyle(color: AppColors.fontColor),
                                  controller: widget.phoneNumberController,
                                  onChanged: (value) => widget.screenStore.setPhoneNumber(value),
                                  validator: _phoneNumberValidator,
                                  decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context).translate(widget.screenConstants.phoneNumberHint),
                                    labelText: AppLocalizations.of(context).translate(widget.screenConstants.phoneNumberLabel).toUpperCase(),
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
                                            .translate(widget.screenConstants.birthdayHint).toUpperCase()),
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
                                              initialDate: widget.screenStore.birthday,
                                              firstDate: DateTime.now()
                                                  .subtract(new Duration(days: (365 * 70))),
                                              lastDate: DateTime.now(),
                                            );

                                            if (newBirthday != null) {
                                              widget.screenStore.setBirthday(newBirthday);
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: TextsBuilder.regularText(
                                              DateUtils(context)
                                                  .fromDateToString(widget.screenStore.birthday),
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
                                                SettingsGenderScreen(widget.screenStore),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextsBuilder.textHint(
                                            AppLocalizations.of(context)
                                                .translate(widget.screenConstants.genderHint).toUpperCase(),
                                          ),
                                          Container(
                                            child: TextsBuilder.regularText(GenderUtils()
                                                .getGenderString(
                                                widget.screenStore.gender, context)),
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
                                                  SettingsNationalityScreen(widget.screenStore.livingInId, widget.screenStore.setLivingIn)),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextsBuilder.textHint(
                                            AppLocalizations.of(context)
                                                .translate(widget.screenConstants.currentlyLivingInHint).toUpperCase(),
                                          ),
                                          Container(
                                            child: TextsBuilder.regularText(
                                                widget.screenStore.livingInLabel),
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
                                EdgeInsets.only(top: AppSizes.inputTopMargin(context), bottom: AppSizes.inputTopMargin(context) * 2),
                                child: Observer(
                                  builder: (_) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingsNationalityScreen(widget.screenStore.countryId, widget.screenStore.setCountry)),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextsBuilder.textHint(
                                            AppLocalizations.of(context)
                                                .translate(widget.screenConstants.nationalityHint).toUpperCase(),
                                          ),
                                          Container(
                                            child: TextsBuilder.regularText(
                                                widget.screenStore.countryLabel),
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
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  String _firstNameValidator(String value) {
    if ( value == null || value.isEmpty ) {
      return AppLocalizations.of(this.context).translate(widget.formConstants.firstNameIsRequired);
    }
    return null;
  }

  String _lastNameValidator(String value) {
    if ( value == null || value.isEmpty ) {
      return AppLocalizations.of(this.context).translate(widget.formConstants.lastNameIsRequired);
    }
    return null;
  }

  String _phoneNumberValidator(String value) {
    if ( value == null || value.isEmpty ) {
      return AppLocalizations.of(this.context).translate(widget.formConstants.phoneNumberIsRequired);
    }
    return null;
  }

  _save() {

    if (!widget._formKey.currentState.validate()) {
      setState(() {
        widget.autoValidate = true;
      });
      return;
    }

    widget.screenStore.setIsLoading(true);
    restServices.getUserService().updateUserPersonalDetails(context,
        widget.firstNameController.text,
        widget.lastNameController.text,
        widget.screenStore.gender == Gender.MALE ? "MALE" : "FEMALE",
        widget.screenStore.countryId,
        widget.screenStore.livingInId,
        widget.phoneNumberController.text,
        widget.screenStore.birthday)
        .then((value) {
      restServices.getUserService().getUserPersonalDetails(context);
      ToasterBuilder.buildSuccessToaster(context, AppLocalizations.of(context).translate(widget.generalConstants.successfullySavedText));
      Navigator.pop(context);
    })
        .catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() => widget.screenStore.setIsLoading(false));
  }
}
