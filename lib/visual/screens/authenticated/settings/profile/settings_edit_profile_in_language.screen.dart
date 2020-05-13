import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/localization/constants/form_validation.constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/profile_screen.constants.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/profile/profile.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/avatar/professor_avatar.widget.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class EditProfileInLanguageScreen extends StatefulWidget {
  FormValidationConstants formConstants = FormValidationConstants();
  GeneralConstants generalConstants = GeneralConstants();
  ProfileScreenConstants profileConstants = ProfileScreenConstants();

  final _formKey = GlobalKey<FormState>();

  BuildContext context;
  int languageId;
  bool autoValidate = false;

  EditProfileInLanguageScreen(this.languageId);

  @override
  _EditProfileInLanguageScreenState createState() =>
      _EditProfileInLanguageScreenState();
}

class _EditProfileInLanguageScreenState
    extends State<EditProfileInLanguageScreen>
    with AfterInitMixin<EditProfileInLanguageScreen> {
  TextEditingController designationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.context = context;
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar(
              [
                Observer(
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(),
                      child: ButtonsBuilder.transparentButton(
                        AppLocalizations.of(context)
                            .translate((profileDetailsStore.id != null
                                ? widget.generalConstants.buttonSaveLabel
                                : widget.generalConstants.buttonAddLabel))
                            .toUpperCase(),
                        () {
                          profileDetailsStore.setIsLoading(true);
                          if (_isCreatingProfile()) {
                            createProfile();
                          } else {
                            updateProfile();
                          }
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ];
        },
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Form(
            key: widget._formKey,
            autovalidate: widget.autoValidate,
            child: Observer(
              builder: (_) {
                if ( profileDetailsStore.isLoading ) {
                  return DefaultLoaderWidget();
                } else {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: CustomScrollView(
                          slivers: <Widget>[
                            /// Avatar
                            SliverToBoxAdapter(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height / 30),
                                padding: AppPaddings.regularPadding(context),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Observer(builder: (_) {
                                      return ProfessorAvatarWidget(
                                        '${userStore.firstName} ${userStore.lastName}',
                                        userStore.pictureUrl,
                                        textColor: AppColors.fontColor,
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),

                            /// DETAILS
                            SliverToBoxAdapter(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: sectionTopMargin,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /// ABOUT
                                    Container(
                                      padding: AppPaddings.regularPadding(context),
                                      margin:
                                      EdgeInsets.only(top: sectionTopMargin / 4),
                                      child: TextsBuilder.h4Bold(
                                        AppLocalizations.of(context).translate(widget
                                            .profileConstants.defaultAboutLabel),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                      EdgeInsets.only(top: sectionTopMargin / 2),
                                      padding: AppPaddings.regularPadding(context),
                                      child: TextFormField(
                                        validator: _aboutValidator,
                                        controller: descriptionController,
                                        style: TextStyle(color: AppColors.fontColor),
                                        decoration: InputDecoration(
                                          fillColor: AppColors.bgInputColor,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  width: 2.0,
                                                  color: Colors.grey[300])),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 8,
                                        maxLength: 250,
                                      ),
                                    ),

                                    /// QUOTE
                                    Container(
                                      padding: AppPaddings.regularPadding(context),
                                      margin:
                                      EdgeInsets.only(top: sectionTopMargin / 4),
                                      child: TextsBuilder.h4Bold(
                                        AppLocalizations.of(context).translate(widget
                                            .profileConstants.defaultQuoteLabel),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: sectionTopMargin / 2,
                                          bottom: sectionTopMargin * 2),
                                      padding: AppPaddings.regularWithBottomPadding(
                                          context),
                                      child: TextFormField(
                                        validator: _quoteValidator,
                                        controller: quoteController,
                                        style: TextStyle(color: AppColors.fontColor),
                                        decoration: InputDecoration(
                                          fillColor: AppColors.bgInputColor,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  width: 2.0,
                                                  color: Colors.grey[300])),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 8,
                                        maxLength: 25,
                                      ),
                                    ),

                                    /*
                            Container(
                                alignment: Alignment.center,
                                padding: AppPaddings.regularPadding(context),
                                margin: EdgeInsets.only(top: sectionTopMargin / 4),
                                child: ButtonsBuilder.redFlatButton('Save', () {


                                },),
                            ),

                             */
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  createProfile() {
    if (!widget._formKey.currentState.validate()) {
      return;
    }

    restServices
        .getProfileDetailsService()
        .createProfileDetails(
            context,
            widget.languageId,
            designationController.text,
            descriptionController.text,
            quoteController.text)
        .then((_) {
      restServices
          .getProfileDetailsService()
          .getProfileDetailsByLanguageId(context, widget.languageId);
      restServices
          .getLanguageProfileService()
          .getAvailableProfileLanguages(context);
      restServices
          .getLanguageProfileService()
          .getExistingProfileLanguages(context);

      // back to settings
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }
  updateProfile() {
    if (!widget._formKey.currentState.validate()) {
      return;
    }

    restServices
        .getProfileDetailsService()
        .updateProfileDetails(
        context,
        profileDetailsStore.id,
        designationController.text,
        descriptionController.text,
        quoteController.text)
        .then((_) {

      // back to settings
      Navigator.pop(context);
      Navigator.pop(context);
    })
        .catchError( (e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() => profileDetailsStore.setIsLoading(false));
  }

  String _aboutValidator(String value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.aboutIsRequired);
    } else if (value.length > 250) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.maxLengthAsBeenExceeded);
    } else {
      return null;
    }
  }

  String _quoteValidator(String value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.quoteIsRequired);
    } else if (value.length > 250) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.maxLengthAsBeenExceeded);
    } else {
      return null;
    }
  }

  @override
  void didInitState() {
    if (profileDetailsStore.id != null) {
      restServices
          .getProfileDetailsService()
          .getProfileDetailsByLanguageId(context, profileDetailsStore.id)
          .then((_) {
        setState(() {
          _updateState();
        });
      });
    } else {
      profileDetailsStore.setIsLoading(false);
    }
  }

  _updateState() {
    designationController.text = profileDetailsStore.designation;
    descriptionController.text = profileDetailsStore.description;
    quoteController.text = profileDetailsStore.quote;
  }

  _isCreatingProfile() {
    return profileDetailsStore.id == null;
  }
}
